module ApplicationHelper
    include Pagy::Frontend

    def highlight(text, phrases, options = {})
        text = sanitize(text) if options.fetch(:sanitize, true)

        if text.blank? || phrases.blank?
          text || ""
        else
          match = Array(phrases).map do |p|
            Regexp === p ? p.to_s : Regexp.escape(p)
          end.join("|")

          if block_given?
            text.gsub(/(#{match})(?![^<]*?>)/i) { |found| yield found }
          else
            highlighter = options.fetch(:highlighter, '<mark>\1</mark>')
            text.gsub(/(#{match})(?![^<]*?>)/i, highlighter)
          end
        end.html_safe
    end
end
