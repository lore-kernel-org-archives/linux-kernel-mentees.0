Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0DDC2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 19:18:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1E62071E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 19:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1E62071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5B9E820488;
	Mon, 30 Dec 2019 19:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V04eHn3J4y7m; Mon, 30 Dec 2019 19:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F2F69204F5;
	Mon, 30 Dec 2019 19:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E04E5C1796;
	Mon, 30 Dec 2019 19:18:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1387CC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F3EB087582
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ap+hqpsxWfAV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C12BB87554
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 19:18:08 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 318352B4;
 Mon, 30 Dec 2019 19:18:08 +0000 (UTC)
Date: Mon, 30 Dec 2019 12:18:07 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191230121807.3a1f5f38@lwn.net>
In-Reply-To: <92be5a49b967ce35a305fc5ccfb3efea3f61a19a.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
 <92be5a49b967ce35a305fc5ccfb3efea3f61a19a.1577681164.git.dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/8] Documentation:
	nfsroot.txt: convert to ReST
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

On Mon, 30 Dec 2019 01:55:56 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Convert nfsroot.txt to RST and move it to admin-guide. Content remains
> mostly the same.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

This one, too, is almost there, but ...

>  Documentation/admin-guide/nfs/index.rst       |   1 +
>  .../nfs/nfsroot.rst}                          | 140 ++++++++++--------
>  2 files changed, 76 insertions(+), 65 deletions(-)
>  rename Documentation/{filesystems/nfs/nfsroot.txt => admin-guide/nfs/nfsroot.rst} (83%)
> 
> diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
> index f5c0180f4e5e..c2b87e9f0fed 100644
> --- a/Documentation/admin-guide/nfs/index.rst
> +++ b/Documentation/admin-guide/nfs/index.rst
> @@ -6,4 +6,5 @@ NFS
>      :maxdepth: 1
>  
>      nfs-client
> +    nfsroot
>  
> diff --git a/Documentation/filesystems/nfs/nfsroot.txt b/Documentation/admin-guide/nfs/nfsroot.rst
> similarity index 83%
> rename from Documentation/filesystems/nfs/nfsroot.txt
> rename to Documentation/admin-guide/nfs/nfsroot.rst
> index ae4332464560..85d834ad3d03 100644
> --- a/Documentation/filesystems/nfs/nfsroot.txt
> +++ b/Documentation/admin-guide/nfs/nfsroot.rst
> @@ -1,18 +1,24 @@
> +===============================================
>  Mounting the root filesystem via NFS (nfsroot)
>  ===============================================
>  
> -Written 1996 by Gero Kuhlmann <gero@gkminix.han.de>
> -Updated 1997 by Martin Mares <mj@atrey.karlin.mff.cuni.cz>
> -Updated 2006 by Nico Schottelius <nico-kernel-nfsroot@schottelius.org>
> -Updated 2006 by Horms <horms@verge.net.au>
> -Updated 2018 by Chris Novakovic <chris@chrisn.me.uk>
> +:Authors:
> +	Written 1996 by Gero Kuhlmann <gero@gkminix.han.de>
> +
> +	Updated 1997 by Martin Mares <mj@atrey.karlin.mff.cuni.cz>
> +
> +	Updated 2006 by Nico Schottelius <nico-kernel-nfsroot@schottelius.org>
> +
> +	Updated 2006 by Horms <horms@verge.net.au>
> +
> +	Updated 2018 by Chris Novakovic <chris@chrisn.me.uk>
>  
>  
>  
>  In order to use a diskless system, such as an X-terminal or printer server
>  for example, it is necessary for the root filesystem to be present on a
> -non-disk device. This may be an initramfs (see Documentation/filesystems/
> -ramfs-rootfs-initramfs.txt), a ramdisk (see Documentation/admin-guide/initrd.rst) or a
> +non-disk device. This may be an initramfs (see Documentation/filesystems/ramfs-rootfs-initramfs.txt`),

It's best in general to avoid refilling paragraphs so as to make it clear
what is being changed.  But we would also like to avoid creating such long
lines.  Perhaps an add-on patch refilling things would satisfy both
criteria here.

Also, there seems to be a stray backtick (`) in there.

> +a ramdisk (see Documentation/admin-guide/initrd.rst) or a
>  filesystem mounted via NFS. The following text describes on how to use NFS
>  for the root filesystem. For the rest of this text 'client' means the
>  diskless system, and 'server' means the NFS server.
> @@ -20,8 +26,8 @@ diskless system, and 'server' means the NFS server.
>  
>  
>  
> -1.) Enabling nfsroot capabilities
> -    -----------------------------
> +Enabling nfsroot capabilities
> +=============================
>  
>  In order to use nfsroot, NFS client support needs to be selected as
>  built-in during configuration. Once this has been selected, the nfsroot
> @@ -34,8 +40,8 @@ DHCP, BOOTP and RARP is safe.
>  
>  
>  
> -2.) Kernel command line
> -    -------------------
> +Kernel command line
> +===================
>  
>  When the kernel has been loaded by a boot loader (see below) it needs to be
>  told what root fs device to use. And in the case of nfsroot, where to find
> @@ -44,19 +50,17 @@ This can be established using the following kernel command line parameters:
>  
>  
>  root=/dev/nfs
> -
>    This is necessary to enable the pseudo-NFS-device. Note that it's not a
>    real device but just a synonym to tell the kernel to use NFS instead of
>    a real device.
>  
>  
>  nfsroot=[<server-ip>:]<root-dir>[,<nfs-options>]
> -
>    If the `nfsroot' parameter is NOT given on the command line,
> -  the default "/tftpboot/%s" will be used.
> +  the default ``"/tftpboot/%s"`` will be used.
>  
>    <server-ip>	Specifies the IP address of the NFS server.
> -		The default address is determined by the `ip' parameter
> +		The default address is determined by the ip parameter
>  		(see below). This parameter allows the use of different
>  		servers for IP autoconfiguration and NFS.
>  
> @@ -67,6 +71,9 @@ nfsroot=[<server-ip>:]<root-dir>[,<nfs-options>]
>  
>    <nfs-options>	Standard NFS options. All options are separated by commas.
>  		The following defaults are used:
> +
> +		::
> +

Please don't use the standalone "::" like that.  Just say "used::"

[...]

> -3.) Boot Loader
> -    ----------
> +Boot Loader
> +===========
>  
>  To get the kernel into memory different approaches can be used.
>  They depend on various facilities being available:
>  
>  
> -3.1)  Booting from a floppy using syslinux
> +#. Booting from a floppy using syslinux

Here, too, I wouldn't use "#".  This is essentially an unordered list, so
basic bullets should be fine.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
