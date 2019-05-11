From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 11 May 2019 08:04:20 +0200
Subject: [Linux-kernel-mentees] [PATCH] Staging: kpc2000: kpc_dma:
 resolve checkpath errors and warnings
In-Reply-To: <20190510193833.1051-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
Message-ID: <20190511060420.GA18755@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190511060420.PNy-1CWh9qMRJmCDfW_6-NlFcxOaz2iPc3DbnsEwdWw@z>

On Sat, May 11, 2019 at 01:08:33AM +0530, Vandana BN wrote:
> This patch resolves coding style errors and warnings reported by chechpatch
> 
> ERROR: "(foo*)" should be "(foo *)"
> ERROR: trailing whitespace
> ERROR: space required before the open brace '{'
> ERROR: "foo * bar" should be "foo *bar"
> ERROR: space prohibited after that '!' (ctx:BxW)
> ERROR: space prohibited after that open parenthesis '('
> ERROR: switch and case should be at the same indent
> ERROR: trailing statements should be on next line
> ERROR: Macros with complex values should be enclosed in parentheses
> ERROR: "foo __init  bar" should be "foo __init bar"
> ERROR: "foo __exit  bar" should be "foo __exit bar"
> WARNING: Missing a blank line after declarations
> WARNING: Prefer using '"%s...", __func__' to using function's name, in a string
> WARNING: braces {} are not necessary for any arm of this statement
> WARNING: unnecessary cast may hide bugs
> WARNING: braces {} are not necessary for single statement
> WARNING: struct file_operations should normally be const
> WARNING: labels should not be indented
> Signed-off-by: Vandana BN <bnvandana at gmail.com>
> ---
>  drivers/staging/kpc2000/kpc_dma/dma.c         | 137 +++++------
>  drivers/staging/kpc2000/kpc_dma/fileops.c     | 220 +++++++++---------
>  .../staging/kpc2000/kpc_dma/kpc_dma_driver.c  | 121 +++++-----
>  .../staging/kpc2000/kpc_dma/kpc_dma_driver.h  |  32 +--
>  4 files changed, 265 insertions(+), 245 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
