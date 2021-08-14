Return-Path: <SRS0=qR1B=NF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC10C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Aug 2021 05:20:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8126F60F42
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Aug 2021 05:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8126F60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nsec.ac.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EBE960698;
	Sat, 14 Aug 2021 05:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEqKyxdVs6t8; Sat, 14 Aug 2021 05:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 24BEE605EC;
	Sat, 14 Aug 2021 05:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F272AC0010;
	Sat, 14 Aug 2021 05:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12CBCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 05:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E104E401FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 05:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nsec-ac-in.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NcduzQIqu43O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 05:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06606400AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 05:20:18 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id k65so22712968yba.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 22:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nsec-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=xo9uY+crlPGgl8lN2gRpjJUYOUZEYqcSEilsTlcodSY=;
 b=cNrrwmycOOMLVoHIFQ7aCC/rP5DB6GNjgZ5a4Jtv7Lodn4x4aV9sNbygbzC4eTi12C
 z1Jck8TTUxy5Ag87Bka2X7a52x0/Tpzbj/rNBiOwiFaGhWiLGk5tLyL3Vp0vekUgdcxO
 4Lyq12/V07ifSPw3h1zuEIBNt/OjSo47+03H8hZoGb85ZD94L502q4HpPPuZj28A/WhC
 qJJRjeWMGgCr7px5xPkjzVtC6yG+XjeVnnSNUZkBPmE/njoLQHaHN3D0V50b3Bo0vRTg
 E5sIZQ5TGMzZAMZbvktW9D8453Pwzzo8A18BM8Scp+PnumAxkBoH2fPOTj7TfUNgU2NQ
 XGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xo9uY+crlPGgl8lN2gRpjJUYOUZEYqcSEilsTlcodSY=;
 b=R4LPhY3YWqARecV8exCvtFXKZQgwfTexGZWZl/Ed5HK0XgXPoxvCv1c2U3BdLZYY6s
 rxIswtUK25mKy7RcGimK8jl+HbuF5A/4oPSv972dsljCaaccgOGBfO422Jo3WanAFHFN
 n7VYKDleEX35X0i7fvzMkw9K5JN3up/UUnLkbqIkR6eKY3SzyCq0y/l08s+AM9Xoiwi5
 Q4lD6qvFhHPEzdwLLxPg9B4oI48E169d24sMDOpVXjL/KOYixq0bbeSpGzXufwuHbedM
 4RL5JFnlv7sLymSwTkxuCpvVFDFyz0TqkBh0HFk95dsk9MxSDUVdrBDS84q74JIOh4lJ
 Cf/g==
X-Gm-Message-State: AOAM530xcHYZmSEWrDrSHfKveQs4S+aTlXU2yRIKD15fVLZIowYfWswu
 jRGfI0BCLizyRHnNlX/8Ng0K0bZKRtXdWWdl1P6FDg==
X-Google-Smtp-Source: ABdhPJwRNVEX6XuvFSQXFr7B/3naX+tMvFkSTuJPbr4joj/1MqtTJvqbFCC9BHLoRYOEn6OTEWlhoq1jQpO3koHRMRU=
X-Received: by 2002:a5b:783:: with SMTP id b3mr7814022ybq.328.1628918417930;
 Fri, 13 Aug 2021 22:20:17 -0700 (PDT)
MIME-Version: 1.0
From: nishant kumar <nishantkumar.cse2020@nsec.ac.in>
Date: Sat, 14 Aug 2021 10:50:05 +0530
Message-ID: <CACpr4a=oSgrugYnLHxGiACm95RdFSXeyPgpH6=o4Ydx3r6+6Cw@mail.gmail.com>
Subject: Mining Maintainers mentorship programs
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1766544588784665253=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1766544588784665253==
Content-Type: multipart/alternative; boundary="000000000000ab51a805c97e1f86"

--000000000000ab51a805c97e1f86
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection. Work and finish the
tasks for the mentee selection

--000000000000ab51a805c97e1f86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.80000019073486=
3px;white-space:pre-line">I am interested in the Mining Maintainers mentors=
hip program and I would like to work on the tasks for the mentee selection.=
 Work and finish the tasks for the mentee selection</span><br></div>

--000000000000ab51a805c97e1f86--

--===============1766544588784665253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1766544588784665253==--
