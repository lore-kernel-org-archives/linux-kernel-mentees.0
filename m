Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5590E7D0B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Sep 2023 23:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634B842171;
	Thu, 21 Sep 2023 23:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634B842171
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hW7T6nzF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkZtrme_DTDN; Thu, 21 Sep 2023 23:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2B34842144;
	Thu, 21 Sep 2023 23:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B34842144
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0523FC0039;
	Thu, 21 Sep 2023 23:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C644FC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 23:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A40542147
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 23:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A40542147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oj0ZYtE9sbwN
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 23:54:40 +0000 (UTC)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6A7442144
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 23:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A7442144
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4524dc540c7so793311137.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695340478; x=1695945278;
 darn=lists.linuxfoundation.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9Hm9WW7hUfCvyE8rtYKRmcgk9jv/z1nff7HdEAt1HzA=;
 b=hW7T6nzFQgU3v4jy8vjDKXa9ZvO82GkZyAWaQbwCIPecMuVKXY+6+5cSJwiltFrYma
 1gFzEmgi8xRAyeSAIfLsGtih5QdPhKme/ehpFE0FpMtH1GDKPcg7EEbIfufWRd/d8pX1
 p0633YK+GOT6mJqSJ3sVlq2RyXrzfDq2Md4eIeVocEgl3S2oV5hhrDz2b5EwTMl1TVzv
 vpHh1IMhAefPkiiiUhHBbWNJrDgXNdg4q06TcbPWuNIJU8I9tLU0yqc1v8ex/mFLWamA
 8AJiwe52gcf1I5y7lN4iUzM+TU+4EUdGAAAJJnwnvgNjAmyKJ+XpEl5kuDKJs15tkfDP
 tywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695340478; x=1695945278;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Hm9WW7hUfCvyE8rtYKRmcgk9jv/z1nff7HdEAt1HzA=;
 b=hxWR4BmKZZhe+xkuAMPh3S//a40mLicX9GLZD5cw2c5qRTeEROlcNNljFh6Nun3Dh3
 YErchBuaiqKceOmmjqB+eL+CbpkntvEtRb7y1nRAbkutAj6YouY67mP7y1DvMTwCvm6Y
 73DFSA7Kx50hAeuEGd6nR06pb9wGv0CMCiUI86eSxZBptmTZ18TBq2YOC2Ck/n/Y+V5Y
 6VZaLUQUwCwGN90AXST6wY5TN6/RrbRRcDmvfZApYsGf7dFNI61C5oRG7iA0weyGu42k
 eEN1hJurSNXYMNNR+CZRw1Ld7PtFgYE8e4glWlCKh8h+24y7VnZRyfs8hcA952guxXZ/
 L0VA==
X-Gm-Message-State: AOJu0YyHzw+616e1in7zsYOJZ9G4y3Ah2xHqhybMEAeTjlZZumpEXQv0
 6+w/6j6vVlbKMZ3UFmfsqchxLnDGpXOqnrJjPYUpsbE7sCk=
X-Google-Smtp-Source: AGHT+IFJUzC5dGWqpJt7ymOhLmWEhDN/BR0TO91Do1DbXjpy1lLrLQdZqWQnnZySxXUUQJBTO8EB+Rm9iiS/02kenVY=
X-Received: by 2002:a05:6102:4a86:b0:452:c581:5a07 with SMTP id
 hz6-20020a0561024a8600b00452c5815a07mr2059650vsb.11.1695340478385; Thu, 21
 Sep 2023 16:54:38 -0700 (PDT)
MIME-Version: 1.0
From: Medha Tiwari <medhatiwari001@gmail.com>
Date: Fri, 22 Sep 2023 05:24:26 +0530
Message-ID: <CAFWjg1Kpa8_KD5f0Hc1rEQdVSFbU-DAqhMj+yq=osfLYPvNpPA@mail.gmail.com>
Subject: Drop my mail
To: Linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============0054518610746251340=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0054518610746251340==
Content-Type: multipart/alternative; boundary="000000000000fcd0f30605e73680"

--000000000000fcd0f30605e73680
Content-Type: text/plain; charset="UTF-8"

I don't want any notifications anymore

--000000000000fcd0f30605e73680
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I don&#39;t want any notifications anymore</div>

--000000000000fcd0f30605e73680--

--===============0054518610746251340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0054518610746251340==--
