From: gregkh@linuxfoundation.org (Greg KH)
Date: Fri, 5 Jul 2019 11:17:21 +0200
Subject: [Linux-kernel-mentees] Testing stable-rc v5.1.17-rc1-g57f5b343c
In-Reply-To: <20190705081141.GA17898@arch>
References: <20190705081141.GA17898@arch>
Message-ID: <20190705091721.GA22725@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190705091721.ZnFYmx3Doi-09d3xcaVpr0mmfSjN8i9X3Ytw9Elencg@z>

On Fri, Jul 05, 2019 at 01:41:41PM +0530, Amol Surati wrote:
> Hi,
> 
> Given that 5.1.17-rc1 is marked on the stable-rc repo, I attempted to
> carry out the required 'stable release contribution' task, ahead, in
> anticipation of receiving the stable-review email.
> 
> Running kselftest (as root) showed the errors displayed below.
> 
> Are these an indication of problems, in my environment, which I must
> fix? Or are some of the failures meant to be ignored?

Do you get the same errors when running 5.1.16?  Try doing that on a
"known good" release first to get your testing system set up properly.

> The 'lkmp stable release contribution' wiki isn't quite clear on what
> needs to be done with kselftest result if there are failures in it.
> 
> Upon checking one of the logs of a test result from linaro - 
> https://lkft.validation.linaro.org/scheduler/job/806628 - it is found
> that certain tests, that fail on my side, either succeed or are marked
> as skipped, on their side.

Some tests are skipped because of various reasons, as you are finding
out :)

thanks,

greg k-h
