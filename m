Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB72C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Jul 2022 19:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F822419E2;
	Mon, 25 Jul 2022 19:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F822419E2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HxkUPJM5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvH1cdXCbB2m; Mon, 25 Jul 2022 19:07:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2F6CB410B1;
	Mon, 25 Jul 2022 19:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F6CB410B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1673C0035;
	Mon, 25 Jul 2022 19:07:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F4FFC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jul 2022 19:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39B9C405AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jul 2022 19:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B9C405AA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HxkUPJM5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlvobJBjV6OI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jul 2022 19:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA484046A
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECA484046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jul 2022 19:06:58 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id e16so11252242pfm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Jul 2022 12:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eaPHtOOOY8qo+YT1sPvH9CgIJLYkA1nmDllA2/WdJf0=;
 b=HxkUPJM5xvgAdGwMkg7IvUnr9TpuKF6GGD6ZjRmBCJ1k6x9i8aK3L4ZC8O31NupPrQ
 VWA2uxN7IJYnpvCYRfDhtD76iED/HQ3SVC9iVlBHUx2FC6UKEWz9vAUiR7vJ/paMEOlv
 1kybJU3iyfhQqBYaRdjhS/2i3RzLNz1iSRhLFOF4ROPVcEgb6yRtNdECI6to5eLTGlPm
 ds4WgL1zCFDSsjj0SDkZ1I2U4yv7Zs9731knpnviq2s6nv//cpAZxOQCPmOsABbimXzP
 ws59iL9xp2RtwirnabDcW0M6WnWVD9tDkZvZmv6SpgbXanISBbp/mlBfN70Ht9a6Ll3Q
 lJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eaPHtOOOY8qo+YT1sPvH9CgIJLYkA1nmDllA2/WdJf0=;
 b=db8ZcQ/YYvUqtQKznVnQ677YG7hLf3aAgmu0JShESv0SO5K1Xz3uzwyh7WYe2pVazO
 QuQdRDMVjcpg3BYT4j79HVQgOccziachCtGFYk17pu+KgUyVEe2YdcNWicumwclSbJjT
 4JY9b5d1wdEX9xQO1SNmDD/HXMuWsonv+hzyEp6li0K4EXEt/DWFlZzjHz/I8fbiqfC0
 SfiBa8Jl08sxna2IZVLwOwB9B+ePIA+1GRKwnEERqdiIPA3JMz7kEtzdklDzDO3BgSa6
 2K6nrhoJ9q2a6KBmL/2jIzTE8LCNQt9P9pbEN41uZM6xNfkFdUmAYe30S84b9Zetxb+E
 uf+w==
X-Gm-Message-State: AJIora/weLPv5dkM5AdbBCkflXBnMI5qRnGEJyTVtuTvZEoXdYdj0TtS
 g3b4cd8+vKpaQMIBxqDr5ok=
X-Google-Smtp-Source: AGRyM1utB88Uz5RGY3veqzZ/lkrZkqK64QL4cYJg+aYYpcQV/CjGovcfjcLw0e/uBQKLgfQ+8HfCtg==
X-Received: by 2002:a62:1509:0:b0:528:98a1:1f7e with SMTP id
 9-20020a621509000000b0052898a11f7emr14149491pfv.11.1658776018203; 
 Mon, 25 Jul 2022 12:06:58 -0700 (PDT)
Received: from Negi ([68.181.16.133]) by smtp.gmail.com with ESMTPSA id
 y23-20020a17090a105700b001efd39b7e39sm11428048pjd.37.2022.07.25.12.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:06:57 -0700 (PDT)
Date: Mon, 25 Jul 2022 12:06:56 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <20220725190656.GA14927@Negi>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
 <Yt1NVQEOC6Ki3eUI@kroah.com> <20220724153448.GA2608@Negi>
 <Yt1rQ8Ft5klOOENg@kroah.com> <20220724221745.GB2608@Negi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724221745.GB2608@Negi>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Anton Altaparmakov <anton@tuxera.com>
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

Hi,

On Sun, Jul 24, 2022 at 03:17:45PM -0700, Soumya Negi wrote:
> On Sun, Jul 24, 2022 at 05:54:43PM +0200, Greg KH wrote:
> > On Sun, Jul 24, 2022 at 08:34:48AM -0700, Soumya Negi wrote:
> > > On Sun, Jul 24, 2022 at 03:47:01PM +0200, Greg KH wrote:
> > > > On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> > > > > Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> > > > > https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> > > > > 
> > > > > Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> > > > > system files. If it isn't(as in the case of this bug where the mft record for
> > > > > $Extend contains a regular file), load_system_files() returns false.
> > > > 
> > > > Please wrap your changelog text at 72 columns like your editor asked you
> > > > to when writing this :)
> > > 
> > > I will correct the changelog(Don't think I can wrap the bug report
> > > link. Checkpatch will still give a warning. Is that okay?).
> > 
> > Yes, do not wrap links.
> > 
> > > > > Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> > > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > > 
> > > > What commit caused this problem?  What Fixes: tag should go here?
> > > 
> > > I don't think this was caused by any specific commit.The $Extend
> > > directory check is not present in any previous releases. Syzbot has
> > > also not been able to produce a cause bisection for the bug. So no fixes
> > > tag(please correct me if I am wrong).
> > > 
> > > > Should it go to stable kernels?  If so, how far back?
> > > 
> > > Since the NTFS extension file was new to NTFS 3.0, perhaps the patch 
> > > should apply all the way back to the first release with NTFS3.0 support?
> 
> > Yes, mark it there.
> 
> Thanks. I will send v2 of the patch. Just want to make sure that the
> patch will apply to 2.6.11.y before marking it.

2.6.11 is where I think NTFS3.0 support was first present and till where
the patch should go. But I am not able to build 2.6.11 on my system and
test the patch. I tried the patch on 4.14 and it works. Should I mark it
to be backported till 4.14 instead?

With thanks,
Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
