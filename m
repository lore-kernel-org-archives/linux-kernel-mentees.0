Return-Path: <SRS0=PNQn=ZS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD345C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 19:27:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B816207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 19:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCUCqPy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B816207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56BF3877ED;
	Tue, 26 Nov 2019 19:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlgHModsaHKT; Tue, 26 Nov 2019 19:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 098D5877E6;
	Tue, 26 Nov 2019 19:27:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F08A0C0881;
	Tue, 26 Nov 2019 19:27:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42322C0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 19:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 30BEC877ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 19:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fqr0vbarsf-Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 19:27:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0B2F877E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 19:27:24 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d202so8866550qkb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 11:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=pqEek6iJJMqcyDblxZodrD/8h6Zp+g54pA6x0F/hDDE=;
 b=jCUCqPy7jEp+Makst3iesebZI2932dsNiL+0qPC7oe3eP3r8vzlK73OmejKHC4q4mF
 W3gV6zOyxla5MSYnWczpX5QTgYjgM8ZaX/Z17EzA4OVRIdf0ZtecvuVVKwtLxSf+bdgY
 OWflkfMeTDM8whtZFE16LqhqXvXWLvfvyP0ZB46SMrhrcLaqTSrYMgLPPhkt2If01oCk
 5ZwLPm/FrUVbPez1LSuOA0FXsFYJH7GNyPySrX9sehS5dTEcuCv3/vL1tlgsheQ3PO7V
 cAiq1H6VahZAhaWWbM49NuBem1qJMe2pljQQep27iOOOiv6MZrsD8UJBBlODyzPaNZtp
 gkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=pqEek6iJJMqcyDblxZodrD/8h6Zp+g54pA6x0F/hDDE=;
 b=LdUGouA3FPcT5/PoQ7Prew9OP3B+IoxrSiTF5vjrY1vR66mmtZnJ+K5JHbiw8GAAkx
 1XJw9vRG66C1NOseX89cYnkQQNs4zIMrSNyoX748usyALYGBRy/M2TSRm1fecxboV95V
 eoP1wWD4hnu0MZZv/+hzJKmGX8t0pNR08xHpALDnv0gfSdJwzd6WquHg+MBi7DK287Dw
 IY88yl3y+bSU9uF0MGILtafBOW/g3qFIMEtWIOqQ5xpXEW48y8gFXtC0q8CnVM2BPGSM
 OL4OazwG01fmoprQujAc5elriiFQq+1TbWTWneXt8u/xnDCTslY5Wmr3LVwci0N53qtu
 O31Q==
X-Gm-Message-State: APjAAAVI2oKYZ73RlLVNsGNwMtSLsIF4N6+yW14gT02RTTUzDGPqcICZ
 vZVCwrjCIdOgaQMg/7XJ/weO4WKsSdQaGQ==
X-Google-Smtp-Source: APXvYqwGjkoJ5BNGgrXk9fbl3mDr9T0A7lPLQHQaaL4oDPSBfU0siu2xel1UoTZ0ACkW6SY3j+cFYw==
X-Received: by 2002:a05:620a:112c:: with SMTP id
 p12mr32035024qkk.179.1574796443633; 
 Tue, 26 Nov 2019 11:27:23 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id c6sm5661174qka.111.2019.11.26.11.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 11:27:23 -0800 (PST)
To: stable@vger.kernel.org
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <55294cee-5a17-bcd1-1014-b0f51c4360bd@gmail.com>
Date: Tue, 26 Nov 2019 16:19:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Linux 5.3.13 BOOT TEST: Compiled, Booted,
	everything OK.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

No crashes and no new errors on dmesg.


Thanks,

Daniel.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
