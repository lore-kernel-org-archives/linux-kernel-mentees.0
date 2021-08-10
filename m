Return-Path: <SRS0=w3Lu=NB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5870DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 05:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB64F6101E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 05:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB64F6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE32D40181;
	Tue, 10 Aug 2021 05:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X0iSKYc-JE0; Tue, 10 Aug 2021 05:14:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AF65440160;
	Tue, 10 Aug 2021 05:14:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 864EBC001A;
	Tue, 10 Aug 2021 05:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67A5BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 05:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CD314037D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 05:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYloKD-GghcS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 05:14:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23EFE40292
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 05:14:28 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r5so16751525oiw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 22:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=unHvftY6jcsUPGYVGFrswAYhS2Pn9lJWYl9zNjBXCmk=;
 b=bC8zfEl1mKBgbn93ON0AS1arKRGxOCUQhiheVKOgPk4tWbtjayPBTUFVOU133S7WEK
 GLuDpN2MOHG1PnIhd2KZ+m4XLkJaPkvT1ouebos9jpK+t89aa2jvr8CwYYCGNxE31pLV
 9a0vISy5FlcrwvpLhQi/gQvlftFfHWUk2b1NLhyrJd1Yas8MnJpfPCA6DUOy5cwj9Y06
 e9vhwipblrF/6HbaLs+98TQV/6/0rnWg3Zn4gFFj4OaETLedtoc80YP7HWtEYRhDRnaF
 zBVhczc/7tk3sG1Oz0IyI8wUv2Ag/CAWugYBf3E0WnL3km2+9lBzZ1nfsTdA0fRpQa3U
 N93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=unHvftY6jcsUPGYVGFrswAYhS2Pn9lJWYl9zNjBXCmk=;
 b=EIBR+0cRGEilNAhDuxkxw32cJQWssP2CioVbINJdSUYOFx2l7nFp3WiP3fm7vAKCN+
 sE4b+duPDPkIUWJh4+RQJHHkv8F5RqN5+qZRU+07wl+LoWnFPWuoWplSOr5WmOysMxUk
 J8tGdk+HWRt0tING5f+fZnaRy5wBbqcRzcqikqE3fOdLrrSQiPP+k/Kg9yWly/b4ybOt
 nu13i3Q+BJr8APbSetjclGMSnE7Yue7bNz56CzKUZ9fxe6A+d5nrfefNuzUuiWMKsbG/
 dkXd79Uf9H+LLQce4ICDoIsibKkZwQzpFHpSkWmbaaCOtEKBAQpoN61+vTTbDXaj2euV
 W4ZA==
X-Gm-Message-State: AOAM533dniIcWAnNSJ1nYPOkUuGwqUi+Hp4mRXIIKbS/3RIW1JapwbcI
 91PoTowReubf8SubK7GMNUxB8bwG+o8ZcyTg/lo=
X-Google-Smtp-Source: ABdhPJwnRZ113KVew20RiOWaoeyKqjeeoPKBQyzotIlbQZHmNP3yykzbfe5T/srFxfxsK4/BF1TfO/UknmjnnaKoZt4=
X-Received: by 2002:aca:f354:: with SMTP id r81mr2203415oih.99.1628572467251; 
 Mon, 09 Aug 2021 22:14:27 -0700 (PDT)
MIME-Version: 1.0
From: Kaliappan yadav <skaliappan1908@gmail.com>
Date: Tue, 10 Aug 2021 10:44:16 +0530
Message-ID: <CANRrH_aXytQp-C9NT=sjJ55fazk_+0u_cFwb_5mNCG+LH4NyPg@mail.gmail.com>
Subject: Application for menteeship
To: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 lukas.bulwahn@gmail.com
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
Content-Type: multipart/mixed; boundary="===============0296963709832818236=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0296963709832818236==
Content-Type: multipart/alternative; boundary="00000000000066cb1d05c92d9346"

--00000000000066cb1d05c92d9346
Content-Type: text/plain; charset="UTF-8"

Greetings Sir/Ma'am,
I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.
Thank you with anticipation

--00000000000066cb1d05c92d9346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Greetings Sir/Ma&#39;am,<div><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">I am interested =
in the Checkpatch Documentation mentorship program and I would like to work=
 on the tasks for the mentee selection.</span><br></div><div><span style=3D=
"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,=
Arial,sans-serif;font-size:12.8px;white-space:pre-line">Thank you with anti=
cipation</span></div></div></div>

--00000000000066cb1d05c92d9346--

--===============0296963709832818236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0296963709832818236==--
