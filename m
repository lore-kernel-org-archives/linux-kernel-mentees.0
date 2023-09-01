Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A37EE14D3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Sep 2023 18:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C50941B1A;
	Wed,  6 Sep 2023 18:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C50941B1A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=STTCixu1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9qaQRItV9oV; Wed,  6 Sep 2023 18:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 132C441B81;
	Wed,  6 Sep 2023 18:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132C441B81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0160C0DDF;
	Wed,  6 Sep 2023 18:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38CF9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Sep 2023 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0017E8146E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Sep 2023 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0017E8146E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=STTCixu1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdC4aAlpAeGM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Sep 2023 21:12:20 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DE3C81449
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Sep 2023 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE3C81449
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9a62a3f10c5so13241466b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 Sep 2023 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693602738; x=1694207538;
 darn=lists.linuxfoundation.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jwF66SuH+WnA3xvcI4K5NGD2GK+EtCyaWdS/tQYeoHI=;
 b=STTCixu14aOCsLtT4CTuTIaUQW0rxN5xeuRBShJX1+xmqeyu3GdS6LEzsWVDrTObT7
 pMnINM2Sjzj0U1c6YB59IuyKclIQPXMU7nZ0dodj6zHsdP3yBecGUrpjUl/EsCtekLXa
 0K1EMpcZWlDLjNqnL0t7hBqj664T3qBhjxqkdT0d+aYwuz5L4TIU0k3gHAyZko1T1JRf
 Va0qeM4fkM/SgrQPPWUM+YbXJFHnaVcZxUEg4I+jOq9QmxoK0f8yFYlivxUys8LSki6p
 NsrhdDT9h8QZfQkOaiqe0mopRPIcoKiE9dSnMfdfCjUsU8Ma0uD+GgiVca+xefXl6rVF
 bM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693602738; x=1694207538;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwF66SuH+WnA3xvcI4K5NGD2GK+EtCyaWdS/tQYeoHI=;
 b=MhRNjojjws/pem1bd80D8w/hnWmc6VaU2nlHf9+IO72DO0CSsL0KGepE+8y0Wa39hm
 DKWmk57uwdGBpLFRvsIh5G9iF9WdvrEC1X61M4deerL32q2WyHMA1QjkZwFLiolXWnJ8
 jdJR1nkmQog1vOJlw33orvdgoFwtTBlvB8v/Ki1KzUJyZMwa0jpF1OmjPVitQbnJBNxO
 XhTsrn/xj+UvbzA1Nt3SHJ/ehIlln5OkG1kBCEp0W6MZ6gtLlvMM9W5CgbX/auRaKu+D
 woMzrFTAmhmu1jqmqwEm0wYKc2BHLYYylrS8xyaflZi2oVEZ34VyMM3pB41jc+Pwqdgx
 kOiQ==
X-Gm-Message-State: AOJu0YxpCYX5wC2VEPhNtxw3Xn4sOjkmps4JsUx1yW41F0doYdtwmkJf
 gTN/p5B3MLg7RAaygK9DgiUXX6wtve8Ccn19Pm7tj+hr
X-Google-Smtp-Source: AGHT+IFDS5t8fDTB/zUbszOy+LmWUrGkwSJlgrx0LYOKe8S+tnvWVlsNiy7yDCIHweGJ+uyGtcCM43r9G5fnFYOAqHA=
X-Received: by 2002:a17:906:74da:b0:9a1:f6b2:7852 with SMTP id
 z26-20020a17090674da00b009a1f6b27852mr2621811ejl.1.1693602738112; Fri, 01 Sep
 2023 14:12:18 -0700 (PDT)
MIME-Version: 1.0
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
Date: Sat, 2 Sep 2023 02:42:06 +0530
Message-ID: <CAHvgv0Hm2yVCQAWV4Y=GG_G+Typ3CCD7xP1F22vScHiN3n--WQ@mail.gmail.com>
Subject: Subscribing
To: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:52:54 +0000
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
Content-Type: multipart/mixed; boundary="===============7740384955329236750=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7740384955329236750==
Content-Type: multipart/alternative; boundary="000000000000988c120604529d43"

--000000000000988c120604529d43
Content-Type: text/plain; charset="UTF-8"

Subscribe

--000000000000988c120604529d43
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Subscribe</div>

--000000000000988c120604529d43--

--===============7740384955329236750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7740384955329236750==--
