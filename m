Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_IMAGE_ONLY_08,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6C7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 14:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F9860FC4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 14:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9F9860FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=me.vjti.ac.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D9240743;
	Thu, 12 Aug 2021 14:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lwlwo8HSDlrs; Thu, 12 Aug 2021 14:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8A1D40747;
	Thu, 12 Aug 2021 14:36:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F439C0010;
	Thu, 12 Aug 2021 14:36:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A09AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 14:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BCC040540
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 14:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=me-vjti-ac-in.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRTyoZRR3xXK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 14:35:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1ABF404A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 14:35:58 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so8066859oti.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=me-vjti-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Oi42dMr/APT4pRNHyGsl4QhiIfx16hSW3GhzY2FBmnc=;
 b=ApHgQPU1IKs7vmLE7PUDK0I38oeE14eBKKWi5d9s/+yGFZZPS0Z9Cg2qKizMriwgrv
 /QAo0bviOi+YiWkfqfWgMGqT8T88cPNJ0UPJrUCW7l/M1E0liYHZ6CacZj5MbZsZpCCP
 RNqEw+H4lAJ8QGsMJGyyvb37kqEYwvxFIN7871KFkiyDqXIrEAdRw/pa8zCYQZ+eyBkO
 UUeiR6lyKBP+s8eowqk6QTBnjARZTMiVGSa1eiQlZiocjb+vb+hBuvo3wYTwuJ81Q2Zi
 dv+CW0lWCfCYgi63tTRk7KYcSazHXFlCeMso53GdM+xo0+L+E8Wujdt0rlnIbry+oSbQ
 5aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Oi42dMr/APT4pRNHyGsl4QhiIfx16hSW3GhzY2FBmnc=;
 b=bk1PT975oqEzU0uklM63r5koGvvJpM+kw9K7B1SXYDVdVCrGyC8ctkxW7/6KVVF0/u
 +zpvI4lNK932Sy445akk+YHaHgLMuuSd9xgk3TnzgZA5qZl9FL19bPFkRU0NgHaB1GHr
 chYmvNr60BkNrppykpx8lJ7BFI6qbpOpxO4UNIsXZPTJjhtPncYm9cjkAJVYe8dfY7/k
 DN2ZZX3MmebyTKchi9kHW5yn59fIOpGJDjlCSC5RKEZyhljxQTDBTtMj5tzdYcSr4jTO
 atV4vxO1FTse1Om7vviedK73Kp98VKBc330TEr7IPxaooIPyAzP09T7XxrhDaGqtj36L
 jHlg==
X-Gm-Message-State: AOAM5321LDzv2x56RC6juqFgc6CE1HiYtVBb0vNKrjbj4hhoT4J5fP0N
 JYT/WERRzigluXOe/ecCeBgJep0O8fi6GAiBNu3xcrwyZU4x5iSY
X-Google-Smtp-Source: ABdhPJxf+9jDXyacGAU/K6AWF2HD2zctpc3gi2eRyoNbRoh8K017eoJPAjITCx2MSZGLSEkp/CTbXUiZjvBo5bGSnPE=
X-Received: by 2002:a9d:65d0:: with SMTP id z16mr3687095oth.196.1628778957420; 
 Thu, 12 Aug 2021 07:35:57 -0700 (PDT)
MIME-Version: 1.0
From: ANUSHREE SABNIS <absabnis_b19@me.vjti.ac.in>
Date: Thu, 12 Aug 2021 20:05:46 +0530
Message-ID: <CAE3uYxtRShk=tVfzNSsMQ9MBi22ZXo8tbSSrZBkF3TpFJFtBjw@mail.gmail.com>
Subject: Checkpatch Documentation Mentorship Program
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============8333122638451992766=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8333122638451992766==
Content-Type: multipart/alternative; boundary="0000000000002cca9e05c95da72b"

--0000000000002cca9e05c95da72b
Content-Type: text/plain; charset="UTF-8"

Respected mentors,   I am interested in the Checkpatch Documentation
mentorship program and I would like to work on the tasks for the mentee
selection.
Sincerely,
Anushree Sabnis

--0000000000002cca9e05c95da72b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">Respected mentors,
=C2=A0
I am interested in the Checkpatch Documentation mentorship program and I wo=
uld like to work on the tasks for the mentee selection.
</span><font color=3D"#212529" face=3D"Poppins, Roboto, Helvetica Neue, Ari=
al, sans-serif"><span style=3D"font-size:12.8px;white-space:pre-line"><br><=
/span></font>Sincerely,<br>Anushree Sabnis<br><img id=3D"snvTrackImg" src=
=3D"https://signaldomn.online/track/1628778946250.png?eId=3D-718349774" wid=
th=3D"1" height=3D"1" alt=3D""></div>

--0000000000002cca9e05c95da72b--

--===============8333122638451992766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8333122638451992766==--
