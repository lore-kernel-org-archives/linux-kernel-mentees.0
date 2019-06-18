From: gregkh@linuxfoundation.org (Greg KH)
Date: Tue, 18 Jun 2019 07:41:58 +0200
Subject: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
In-Reply-To: <20190618053227.31678-1-puranjay12@gmail.com>
References: <20190618053227.31678-1-puranjay12@gmail.com>
Message-ID: <20190618054158.GA3713@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618054158.C_rGsabn-yjGahojF6IUERCmE9VZVtoGcpvsML0tjrw@z>

On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:
> This converts the plain text documentation to reStructuredText format.
> No essential content change.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  Documentation/platform/x86-laptop-drivers.rst | 23 +++++++++++++++++++
>  Documentation/platform/x86-laptop-drivers.txt | 18 ---------------
>  2 files changed, 23 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/platform/x86-laptop-drivers.rst
>  delete mode 100644 Documentation/platform/x86-laptop-drivers.txt

Don't you also need to hook it up to the documentation build process
when doing this?

thanks,

greg k-h
