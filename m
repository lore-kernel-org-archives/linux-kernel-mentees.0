Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1746DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:38:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25BC21D79
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B25BC21D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D36A868E4;
	Sun, 24 Jan 2021 16:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJDM9m9K-6-1; Sun, 24 Jan 2021 16:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA095868E3;
	Sun, 24 Jan 2021 16:38:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0542C0FA7;
	Sun, 24 Jan 2021 16:38:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43D0CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 32DFB85E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1AKfzcFG9Yn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:38:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 44DCD85E09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:38:12 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id n2so21676397iom.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nHaBdOSCS5fisMfew4ROifh/wH9+5f9pfnnksC/kWrY=;
 b=rUF1Tk/df7jNJ33BTlAvifwISW85We5jmpupaty0Vz91XayLGwnUvIQrknSzxMMiuA
 W8xzqghfF0qo/3tG0DUjrQhQMaHlIPjlwyJXuDDU21Pl5lXqg/GADvZ9CArNaBhOvEhU
 azhOJjyssAb1Df5roXaBP81diYCGe3lsDEx6ABbdV88UCncG/9LIyqNWzslKIDhlyFru
 k2X6WPXxTTtIsaiPUz7kd/lUwHJcqeKhTorvjO++BBisMXm72zu5UZaBFXXceCMAMWxC
 7t62BKrwFrhPOkQglPulpc5ooz9Q9qIeUsEX+shM5+xs4UoSdPVTIP8JnBy0cDa+OZfS
 mT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHaBdOSCS5fisMfew4ROifh/wH9+5f9pfnnksC/kWrY=;
 b=JFRtPv/eT4IhnQFZzWCEVRoyjU52yvV8s88HaNB7Ozn+hjS06RF6h5T/YsVsCA1GJV
 wz6OdFVavEIXZZvIVJS9x6+WCumuWiDM+7WAlUzwgp0b28urT4JjY7uQ8ns5s3NZ4Tr9
 PZInWcvhQyhmTv66daSmvvoRTmh4gZg0h2l7OKz4D4tibbMcIC7gq1mHoTRi+Djc0P/E
 4FOKMkZXgeUeQ5nVqCYOt2K/2B3HUmucbA7aFrYAATjrmZ+QRYKxChSepRsLL9P7XK5B
 iX6O93KVhLxQtGUOfKnP3CJnNq2FdFuC/5z9MbDjnRpq91eZtQGkS8eXTz5j7vNExi9R
 t++A==
X-Gm-Message-State: AOAM532XZMw6OXK/nkZ8hG+Q/aLEQJ38qr6vIft2RxoSfhnv3m0Etc1p
 vuU8/wwDGHpnPg5ssJ5qb04JCUGryfL4POYEhPE=
X-Google-Smtp-Source: ABdhPJzMqv4r8LsYDWGRiqFOmb3QZokmoU+S91jNACszETLerQ9WRrTtTCfkpxRn2GhOYTKHlSd5c6RE3lsTNLoV+WY=
X-Received: by 2002:a92:c986:: with SMTP id y6mr1189497iln.125.1611506291506; 
 Sun, 24 Jan 2021 08:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <20210124151933.19696-4-dwaipayanray1@gmail.com>
In-Reply-To: <20210124151933.19696-4-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 24 Jan 2021 17:38:00 +0100
Message-ID: <CAKXUXMyCU=QLtoXAtvzsa4WjU0Pnw4iezcgja9bSPZJyEPa5qA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 3/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Link the tools directory to the document root for Sphinx.
>

Sorry, I did not mean "Documentation/tools/checkpatch.rst"
_literally_; I only remembered that there is a subdirectory for
"tools" in Documentation; and quickly wrote the mail without checking
the actual name of the directory... assuming you would find the
directory I meant.

The directory is called "Documentation/dev-tools", it already has an
index file and the checkpatch.pl documentation fits nicely there.

Luksa

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  Documentation/index.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 5888e8a7272f..ddd30e08a440 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -182,6 +182,17 @@ subprojects.
>
>     filesystems/ext4/index
>
> +Tools Documentation
> +-------------------
> +
> +The documentation in this section provides details about the kernel tools
> +and scripts.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   tools/index
> +
>  Other documentation
>  -------------------
>
> --
> 2.30.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
