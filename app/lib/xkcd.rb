class Xkcd
    URL = 'https://xkcd.com/'
    PATH = '/info.0.json'

    attr_reader :images

    def numbers (numbs=[])
      File.readlines('nr.txt').each do |line|
        numbs.push(line.chomp)
      end
      return numbs
    end

    def images (numbs=numbers)
      images=[]
      numbs.each do |num|
        link = "#{URL}/#{num}/#{PATH}"
        resp = Net::HTTP.get_response(URI.parse(link))
        data = JSON.parse(resp.body)
        images.push(data['img'])
      end
      @images=images
    end
end

