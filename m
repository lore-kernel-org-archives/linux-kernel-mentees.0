Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8661C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:15:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A855B20792
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uWvH6L+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A855B20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D7FE85F80;
	Sun, 26 Jul 2020 22:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmOxPmM4RACT; Sun, 26 Jul 2020 22:15:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC61285F49;
	Sun, 26 Jul 2020 22:15:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFD64C0050;
	Sun, 26 Jul 2020 22:15:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D726AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8DF521556
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roGfSsU5q5Ny
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:15:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B3AEB20414
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:15:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id e13so13681037qkg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lYTK0Cb3cN0oru/eBKA51sHEvh1EM60eDT1VBtlot+Y=;
 b=uWvH6L+KGS9WbhlXtAw26c3lrrWVX0uM6pJIfxuh6zZlOcb2hSvT+wkrBX08GocMgl
 hUh0bd8i83H7nMr3UVc8jJmLFGSaPaUA3TwMSpkciFzj0DhBmU6LmMkzRTE3sFaufpVY
 NONbpW3sMAqR3y7jPqzdUSF00AzMzZwwJCtsdS/a0q7Xz2+4ucblqMeDi5rTi9iGTg7Y
 Mg2AIG+IaOkgQwi0BdydES5agtmwi8e/5LyRsq512sci9yZArciKSDduBG1Z0Bb5EPRg
 znbsjzrMKQDfWocazwvH4n8LDFknJmDNIwsruPCPqsGy6PJ3CW7wiD467C3zY0lkXjVJ
 LF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lYTK0Cb3cN0oru/eBKA51sHEvh1EM60eDT1VBtlot+Y=;
 b=WXzekwM1bmOzOsrs76cpqq0md7yo4H+YjH5xbYrf2ZjxAaBMurF49+7abetRD3Lk0B
 YGqDQp707ripWuCMhby/e4ccdsb/xoBbw788AUQnSMzYV6JMM4HYSOsWrw16ZmHCzl7i
 XhyY0Q91bJF8i2OIV9DLwNNJUDWg+zMyy4kH9wWB1n23Xyi0ULoPUMkskirz2GHOorJA
 Pn0eETzynvNUHf3bw39rrfm5O1CPztm0irAxkxQGKXf9bFK7/+1R+d00eWTvqvoS8any
 EGlPwg18RXCf4ueH/p6PsIeTkYb0GPP8n+ujwJXdiUBmdcfVLKcBbR4rXXZet/gtLPpV
 gzdA==
X-Gm-Message-State: AOAM532nLchO1KlNfv7PttfcjNP+nKrM0CO8JboV9m25eCvJe1/BtK1Q
 gvDrwn1T5SM8eXAKpd7dvA==
X-Google-Smtp-Source: ABdhPJxbgUw9Yi1PTtR0qp1W6oVvtOvAU2bbMzhoHpjTL0HdJf1ShRyD3T8eNW+NxeM5u2ReWyo8JA==
X-Received: by 2002:a37:d97:: with SMTP id 145mr20136700qkn.218.1595801714732; 
 Sun, 26 Jul 2020 15:15:14 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id r48sm11573138qtr.17.2020.07.26.15.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 15:15:14 -0700 (PDT)
Date: Sun, 26 Jul 2020 18:15:12 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20200726221512.GA102357@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
 <20200726180752.GA49356@PWN>
 <20200726220823.GI28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726220823.GI28704@pendragon.ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vandana BN <bnvandana@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jul 27, 2020 at 01:08:23AM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> On Sun, Jul 26, 2020 at 02:07:52PM -0400, Peilin Ye wrote:
> > On Sun, Jul 26, 2020 at 08:30:44PM +0300, Laurent Pinchart wrote:
> > > Hi Peilin,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> > > > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > > > it by initializing `vb32` using memset().
> > > 
> > > What makes you think this will fix the issue ? When initializing a
> > > structure at declaration time, the fields that are not explicitly
> > > specified should be initialized to 0 by the compiler. See
> > > https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:
> > 
> > Hi Mr. Pinchart!
> > 
> > First of all, syzbot tested this patch, and it says it's "OK":
> > 
> > 	https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > 
> > > If a structure variable is partially initialized, all the uninitialized
> > > structure members are implicitly initialized to zero no matter what the
> > > storage class of the structure variable is. See the following example:
> > > 
> > > struct one {
> > >     int a;
> > >     int b;
> > >     int c;
> > > };
> > > 
> > > void main() {
> > >     struct one z1;         // Members in z1 do not have default initial values.
> > >     static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
> > >     struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
> > > }
> > 
> > Yes, I understand that. I can safely printk() all members of that struct
> > without triggering a KMSAN warning, which means they have been properly
> > initialized.
> > 
> > However, if I do something like:
> > 
> > 	char *p = (char *)&vb32;
> > 	int i;
> > 
> > 	for (i = 0; i < sizeof(struct vb32); i++, p++)
> > 		printk("*(p + i): %d", *(p + i));
> > 
> > This tries to print out `vb32` as "raw memory" one byte at a time, and
> > triggers a KMSAN warning somewhere in the middle (when `i` equals to 25
> > or 26).
> > 
> > According to a previous discussion with Mr. Kroah-Hartman, as well as
> > this LWN article:
> > 
> > 	"Structure holes and information leaks"
> > 	https://lwn.net/Articles/417989/
> > 
> > Initializing a struct by assigning (both partially or fully) leaves the
> > "padding" part of it uninitialized, thus potentially leads to kernel
> > information leak if the structure in question is going to be copied to
> > userspace.
> > 
> > memset() sets these "uninitialized paddings" to zero, therefore (I
> > think) should solve the problem.
> 
> You're absolutely right. I wasn't aware the compiler wouldn't initialize
> holes in the structure. Thank you for educating me :-)
> 
> For the patch,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

:O No no sir, I'm just rephrasing that LWN article.

Thank you for reviewing the patch! 

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
