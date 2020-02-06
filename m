Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9625C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 12:12:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C6920730
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 12:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="FgvG2cBI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0C6920730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6DE532151E;
	Thu,  6 Feb 2020 12:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8y4gMhUQC8nL; Thu,  6 Feb 2020 12:12:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 097E3207A2;
	Thu,  6 Feb 2020 12:12:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE362C0881;
	Thu,  6 Feb 2020 12:12:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F3EAC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 12:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D52A2151E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 12:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OFFB-7Zf2fC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 12:12:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by silver.osuosl.org (Postfix) with ESMTPS id BC02C2152E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 12:12:05 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z16so6005324iod.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 04:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PFo107MqpbbZak5POBjNZ8ZnCLKs4Wt7KVl/7P0nms=;
 b=FgvG2cBIuhRKJYVrMa/jwc/mRGvUFzNfzs1L2dt7RKxcMe0F71IfHxnh1leuhq5e5J
 5D7npVeLlmQ1vg+FePwxEGtlslQ/Hwh5Uu013/3zR5G0nF3KxDVII++GDtUC5HbAOhgy
 lLPL/Qt547GWoblK22hLLNFIWU9B1EkzncNXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PFo107MqpbbZak5POBjNZ8ZnCLKs4Wt7KVl/7P0nms=;
 b=flRYErcuea9vs9bR6yXjIZUIScgmltFdiZPY2ADmCrF3p/3Ur8fkv4GUzhhw3mdS2O
 yWxLUXBIEmLzp+j1fbJiVXwkymBRJU/CFNySu9+bS1w4XMotvsgdOneFnDVnKrYWyKr4
 f4NROoDaLEq6vaO0hBO6FxNAJeFUkxzX/rlIhmmWEifFjsKuXL0UcGxJaDmpMcvGHTCS
 p3aLPngETz015uzIlMfLZ6sAmdmODnyR3SPXF8KmikzszX0OWwMhXm62/M1NlvNlrvBk
 2I8CvsVyQ+gmuDi5cWD6atHfcJZCnfjvnipjUy/Y/JubH4hxXcZhCeYyxp6/8thB2Lho
 53nw==
X-Gm-Message-State: APjAAAWcSd4DRbPe5vqUgnebYfyI+Vndi27dqV4g36Lqz5EOSRewvS2T
 ir46541ESiu1JEA/Ym2PJBB2mWC6mp1o4TD9SZIDJw==
X-Google-Smtp-Source: APXvYqw+AafqWRMiNeMaK2ZzeSWCKa1a2AEyn5fU8XVpHAXFE2BlGUPEGrIU9uURygwuq1xiPd7p6YF9RY9131TQc3g=
X-Received: by 2002:a5d:9a05:: with SMTP id s5mr32229734iol.252.1580991124557; 
 Thu, 06 Feb 2020 04:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20200129050621.700256-1-dwlsalmeida@gmail.com>
In-Reply-To: <20200129050621.700256-1-dwlsalmeida@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 6 Feb 2020 13:11:53 +0100
Message-ID: <CAJfpegsBHEBX8D2Eyybxmg5XWWyALA5VpFYVT+Ov=gYKx2PvGQ@mail.gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc: markus.heiser@darmarit.de, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
 mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] Documentation: filesystems:
	convert fuse to RST
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

On Wed, Jan 29, 2020 at 6:06 AM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
>
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.
>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Thanks, applied.

Miklos
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
