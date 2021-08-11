Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEAEC43214
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 09:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49CF60EB9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 09:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E49CF60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8453608D0;
	Wed, 11 Aug 2021 09:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y38yJn07NMj1; Wed, 11 Aug 2021 09:59:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A5340605F5;
	Wed, 11 Aug 2021 09:59:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79AFAC0010;
	Wed, 11 Aug 2021 09:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B241AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 09:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BD1C60655
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 09:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzZT9BA-OLyS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 09:59:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2912605F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 09:58:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id h9so3146411ejs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=65gB1IGfqQFDx2VqgKhvs5UwgABk998pwoW1YCc/zsg=;
 b=C5jail3k57k7oiEapyCFa8NGEFnfWFup1PAhU1BPwGfGL7DC+LNTqtqdJZOJcGN+tJ
 a8/UTVdyhy4iS1SvCYe1qxmVaOIJw8qLMhRoeGxb4XQLvF809MFPgzQ6oVBUTmfVIVeD
 d1sgV2jqg1xqe6143k/+GDi+4j7AHkcumZ2orRN8enNHF4BgPR6EHXt72cgATepwra5F
 ainBQHSyow+8rkdytK18WpmVrx1kFcVQZVv91bToLI8CO4WQ1fWL5T//vdlODG1h/pnk
 FvI0z7qtD5zuA99lTl88pTxp2wtrxmd5eUJ0kTf+3jVKAOXk40quRQi6Ak0s6rNeRMyN
 F+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=65gB1IGfqQFDx2VqgKhvs5UwgABk998pwoW1YCc/zsg=;
 b=fW1woo44HFhEvNtFaceEUjX56236IpkAeg9aB4PIpLCmW+QjKCnMcjBB+Byrvb3yJX
 6XMVrGJIrXWhCrLbYNwx89byc7bbtDN1qMizqAXAT9yID/8vh99M+u6MZqEQJ5QUvJSk
 Xore9F7sS39dBlOIR2ISZO2xrvqSTotepbFhBkpqBpN/JVI/2Yz2V/FXWNWTEcd0Gl6l
 Bl6sKZfWCMsdu1alya+Q0PKt5LE4Jmxen18yCjv0R8xmKzxAFLV1Q447NLhJIlm1rb9z
 Wdk1kqzq/RZ1Cla/ChboJqc2DhCFemTZKPbbnnOcQXILIQMdqRKlYS+MJYOkk7gtLSsD
 0r/w==
X-Gm-Message-State: AOAM530vxxn4sdgLvfkl2ElLirkUx7qWAWfiN5H9PER0ECmEFeILy9l5
 sqQxURmMNWJaq2ZKaSN+EArxkIhZr06BTA67sIM=
X-Google-Smtp-Source: ABdhPJwpEwwA4IFDTvPxold8DLEVm7/YBW1DGJvKxb+1SXnwVPN1etY0QLfwb2kgrxln/8p1BDNkPcow7kuWEt6WMto=
X-Received: by 2002:a17:906:a40b:: with SMTP id
 l11mr2882794ejz.185.1628675938061; 
 Wed, 11 Aug 2021 02:58:58 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Luna_S=C3=A1nchez?= <lunasanchez@gmail.com>
Date: Wed, 11 Aug 2021 11:58:47 +0200
Message-ID: <CANzSgS=vgYtG=T=1F55zTH-Eaeuu7RySoJZocNJL8i1UXyDxPg@mail.gmail.com>
Subject: Mining Maintainers mentorship program
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
Content-Type: multipart/mixed; boundary="===============8057748487634488127=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8057748487634488127==
Content-Type: multipart/alternative; boundary="000000000000be131705c945aa11"

--000000000000be131705c945aa11
Content-Type: text/plain; charset="UTF-8"

Hello,

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Thank you and best regards,

Luna Sanchez

--000000000000be131705c945aa11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div>I am interested in the Min=
ing Maintainers mentorship program and I would like to work on the tasks fo=
r the mentee selection.<br><div><br></div><div>Thank you and best regards,<=
/div><div><br></div><div>Luna Sanchez</div></div>

--000000000000be131705c945aa11--

--===============8057748487634488127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8057748487634488127==--
