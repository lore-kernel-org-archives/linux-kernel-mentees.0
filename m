From: corbet@lwn.net (Jonathan Corbet)
Date: Mon, 12 Aug 2019 15:16:34 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: virt: Fix
 broken reference to virt tree's index
In-Reply-To: <20190809132349.GA15460@localhost>
References: <20190809132349.GA15460@localhost>
Message-ID: <20190812151634.49c126a0@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190812211634.f-i4-17z6QDlFxZ3M5Gms_hQtYUmpK1Jxg1t8L_rZC4@z>

On Fri, 9 Aug 2019 14:23:49 +0100
Sheriff Esseson <sheriffesseson at gmail.com> wrote:

> Fix broken reference to virt/index.rst.
> 
> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to
> Documentation/virt")
> 
> Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>

Note that you should keep the "Fixes:" tag on a single line, and not put a
blank line between it and the other tags.  I've fixed that up and applied
the patch, thanks.

jon
