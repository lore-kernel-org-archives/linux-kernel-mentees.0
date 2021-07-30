Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0541DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 18:56:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8417D60EFE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 18:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8417D60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4413782F87;
	Fri, 30 Jul 2021 18:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRzg25KUybYq; Fri, 30 Jul 2021 18:56:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2F71D831D5;
	Fri, 30 Jul 2021 18:56:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01DD0C001B;
	Fri, 30 Jul 2021 18:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98B04C0010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 18:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E0924053E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 18:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7U-LezJe39S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 18:56:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFFB44053C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 18:56:38 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id m193so2929525ybf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IvLVfvI8xGtxfQrALhei0sKKACLQFwelXMhniF6G+LQ=;
 b=bhjJXSzQ3LJmUIus9HVsl7DqJlzBf2M0sGGXb8Xdcy0H/6ktTZzrJf/uiCZPzp8NEn
 Ob2F0/lpx5VMSdiLCfGMSrvoZqvpUrlIxbiEGnjSRyZUKgaLzk7ZMg5hwQu1DSX1kTG2
 kStNTHtOnpJGTZF0KOi1Hk3mlpfVsR1rXI8Yu5d011zL9i/hOlllr+wg23o0MaexQSWS
 XezrQ5Zojw32tsziD2dvtjlodiZKoztn+5KmMcX15qSbxZoVEEF7scHuBse/ZIeLczwd
 RI9whBQ1fEAKfB1vkMLphPxwDGTxtVEXG1IP6Kod4hwJJzMwHf5WJ/k3dpnYCmxnqRel
 NWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IvLVfvI8xGtxfQrALhei0sKKACLQFwelXMhniF6G+LQ=;
 b=f8H+xyG1hIY01EOLO7+/ql2b5PbFM01+WbWH+GxSXHpIvseaTbHMEtHgtbHQi8EdCK
 51+DlGvyHDnWeAArd3ft7nARx887IsTb2k9yRoDaLS1xiWeDF9xgDxAiVH2wrzhDrb+1
 27as2eCBOErvmpVd6gegKRJshr0UeU3ZjZWmInz7OmxXp41iHCkG4srt1SvcaGJ84bHH
 H4N1GRkBo2fTKQk5GHzgi0DufuyP0Whf5UkOdenP7V3FSZn6WGwxGBXreCC6z4EdfdVb
 5vv9dq067QnGsJjDBZrJ92EPjX60/vbUEyz0kmuPrW/O6masbMYK4yN3cDdCjy5uN1Ro
 Z1iQ==
X-Gm-Message-State: AOAM531g3tz3l/83Lzs7deMuh+njp51M0GolKAyFFCIYsMALMKTyhpOf
 owFNp1O5NuBnyfKL84IM01iq1SefmKiiFX2yrlU=
X-Google-Smtp-Source: ABdhPJx9hyn0Tb/4W+SHbBSCUjyXtnuiQi2c2xf5DEQcCYIyCZpcL/9uBg1o/QMIsX/rOnWPs4I3w7+CWSJg2oIfqNI=
X-Received: by 2002:a25:d488:: with SMTP id m130mr5102938ybf.116.1627671397805; 
 Fri, 30 Jul 2021 11:56:37 -0700 (PDT)
MIME-Version: 1.0
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Fri, 30 Jul 2021 22:56:27 +0400
Message-ID: <CADywMdoz9NMyEcx+Rd5_ne9eR4HZCTEc5yvKP3JuHAnfnnD0Yg@mail.gmail.com>
Subject: Request for tasks regarding Checkpatch Documentation mentorship
 program (LFX)
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1197833058535153782=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1197833058535153782==
Content-Type: multipart/alternative; boundary="0000000000007a312b05c85bc755"

--0000000000007a312b05c85bc755
Content-Type: text/plain; charset="UTF-8"

Respected sir,

I am interested in working on the checkpath documentation project under
your mentorship and would like to work on tasks for the selection process.

Sincerely,
Rahul Balaji

--0000000000007a312b05c85bc755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Respected sir,<div><br></div><div>I am interested in worki=
ng on the checkpath documentation project under your mentorship and would l=
ike to work=C2=A0on tasks for the selection process.</div><div><br></div><d=
iv>Sincerely,</div><div>Rahul Balaji</div><div><br></div></div>

--0000000000007a312b05c85bc755--

--===============1197833058535153782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1197833058535153782==--
