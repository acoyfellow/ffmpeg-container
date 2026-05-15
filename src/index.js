import { Container, getContainer } from "@cloudflare/containers";

export class FfmpegContainer extends Container {
  defaultPort = 8080;
  sleepAfter = "10s";
}

export default {
  fetch(request, env) {
    return getContainer(env.FFMPEG, "hello").fetch(request);
  },
};
