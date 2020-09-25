Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA00C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 04:18:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE942085B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 04:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlAvLnUe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE942085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C3BC8203A7;
	Fri, 25 Sep 2020 04:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUgKBYWpkBSO; Fri, 25 Sep 2020 04:18:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9DF5B20398;
	Fri, 25 Sep 2020 04:18:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BCC7C0890;
	Fri, 25 Sep 2020 04:18:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 058EBC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 04:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F02B68756B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 04:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzoxTyWs-MBa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 04:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 618C38756A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 04:18:51 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id t3so434154ook.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ZaexTVRSKhPTjNxCj8vUkxM/2bzMqCPcOMDQVzFNp4=;
 b=KlAvLnUepcjere1ONUL57uGiMxPIBw/MbLGs9wDrzFWiWXihQegE9glRtXk3t55tIh
 Er+cAYqFoqMkutCl5gtexK4KBmmYYGJjIn5Vqhp/LJQZ2DdzFqaVrrwwMeKNDmAWdsiq
 rLy7s3ZOcBQ8aN/i5ck4DyjicDA0FafyfyKtGTH1UdO0Vttjdx5dHb2yBb490e6SI3oB
 y8MoSos/EQ/pb9FXgBCSvTo7cIXN2tSfMqoC55BIf0zV35T9wx8McwLZmtIYp0hI26AV
 vtUMwLyoRvdBC9EkPnyNVD5G9j2JUt0gnClGncmTbl6/KsL1sN41uZZE/wkN80mRFfRm
 d6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ZaexTVRSKhPTjNxCj8vUkxM/2bzMqCPcOMDQVzFNp4=;
 b=q9AkfAJRr/WspPhhgkCP5q6pDA98NfJTx0KB2LjPIEjcb6lEghN7DDCAJMSklq/rdm
 l1eW1wDIziXCBD7sbe+3d3bUFEIudhLITkVeBhiHrsozTPurSssfBptaJ1VQiOASTpZZ
 57qyF7rw9kfydU7zdHgojPDkOVKaD+2PnG4Ecpb5cyA/Mt/VTX2ecQwbS4OYP6fM49yz
 nLFhY6K09HAzlls9UC2R+QUjP9ag91ZDJnOoLLJgbFsR9Ij1QiF5olDbjV4xvo/mmhl2
 HhJFSoC+YDS302Zd7MBEtRwCm5fgmY0ovcUlm2+Edn2S57AQbTeGz64fQtltRuIfYt4r
 /c1A==
X-Gm-Message-State: AOAM531dJlKuV554BTrIZmsz7WY9TDI7jARE2CnNl5kCzdzRrqBjfAX2
 jMVOZNjplOBdhoObmqFLJbY0DSTv1bsneZjU+tg=
X-Google-Smtp-Source: ABdhPJwoazM4w9TZwQ1vMuPE6zKSOQgdJrWGyxLj4frzBGDWN1WofaIG3HWa+/xFUdGC9NDpHWeaFXFgyJ0JsCN2B2k=
X-Received: by 2002:a4a:a385:: with SMTP id s5mr1795131ool.8.1601007530290;
 Thu, 24 Sep 2020 21:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
In-Reply-To: <alpine.DEB.2.21.2009230941250.6068@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 25 Sep 2020 09:48:30 +0530
Message-ID: <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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
As Joe mentioned earlier, there might be four new
warnings to handle better:

1) Same name, different address
2) Same address, different name
3) email extensions present in header but
    not in signed off by
4) comment blocks after name

I am thinking to solve the first three in a single patch.

As for the email extensions part, should it be handled
differently? There will be redundant calls to that
though because it's not an error seen quite often.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
