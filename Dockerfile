FROM ruby:2.6.3-alpine
RUN apk update
RUN apk add build-base
COPY ./Gemfile ./advanced-mis/Gemfile
WORKDIR ./advanced-mis
RUN bundle install
RUN apk del build-base
COPY ./ ./advanced-mis
EXPOSE 4000
CMD bundle exec jekyll serve --host 0.0.0.0 --baseurl ""
