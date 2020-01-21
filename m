Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3F1C33CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 09:35:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCD522522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 09:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="RrM/SSSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCD522522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F35D85E47;
	Tue, 21 Jan 2020 09:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrRRmq-mOHzQ; Tue, 21 Jan 2020 09:35:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B062D844B5;
	Tue, 21 Jan 2020 09:35:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96370C1D80;
	Tue, 21 Jan 2020 09:35:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 299A2C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18A2485E47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sanSchW-JS9L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59ACF844B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1579599315;
 bh=N3sXOpn/r7yO4nZzeeEq+/1WxyJ7flT75iRri3qdTBU=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=RrM/SSSmpI2RUyoK91KZyj9cXmHWZYPCXKKN0JfVALhIPHmKP7ioI7KLoYpBEIDTO
 5uarntIOZbGMSdCx92yEb6+epYsMC8mpL6dKJbscPFbLqksa9JbxZ+KdkGzD4HtlY8
 uDh6PjUyK7O/G/Uv+ZLtt3dMnrt0rcKqWHnOYsZM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.33.93]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lj2XW-1jTS8r3AhK-00dJ0v; Tue, 21
 Jan 2020 10:35:15 +0100
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
Message-ID: <9dd96239-49d0-067a-e30d-0908bb6b034d@web.de>
Date: Tue, 21 Jan 2020 10:35:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:l6m5nzxNdAlqNYDHSkQGl7fo/EjG72vYMtLcaPwNXSuxvPsshHz
 URMU7C6owr2ay5oFEMUBCmrX/86+pnaLY389A5AtLteMCR7KpJkIzVugBGK8voC2fZfH0tR
 8rwFjh43E7toKajSMXxQkkb6MQJQ3v5NM3f6was6PAzoxzuELD5yyBF/IIpbIRGxlSiAL2+
 gexBbOAkWU9nRH7i7h7ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LfCeJXkAIhE=:lRVTxNZW0Rtczp30A7NEPw
 lERFO9e/MXPyUMFlSDne7VqukQ3qDdbfFymE9Ut/6oCMWFW8zCz4L+wMZGC2dcMtvUNs0osol
 GAhqc7gpMJLB/syld6ROOq1VFFLWVPgvjx3JqnQVJkTzGfFAAaeOLebgnpNlRR99MZI6XnXAy
 5CCafJc1xg3kTqNj+ONbCGUGbVn09tqiXxnU6526mtQQ+FadDMp0/RlzglADzy3o57zDpmAil
 noO5qdTRk3O8qUYUbZ1K9GRW28E01OO22Va7OjyaJViiPSZM2siCHkdX5zR20pJ48hEGgS+Ax
 6zCQKR1AQEvOKXEBlgZxp/H3Rl3plzmTYM1K4oI5idBQgYbqx2WL7nXauFqlkMIY/Qcw9wMKD
 2QM5w9nD8yvuKN645XC99tYfUBMHqK4sn7jacm2toHBWYssmXvzqeCcWLmrCb7LmLLVyZTiFt
 8fFYlozSbW/rk5/WxCPiefleeFthuN8CLx46zP+1Mupdek28Qv+2DpO7kSWENFW0iGWJXZ3jH
 YKl1hYR5OSFqv3aYWMptJ4gAT8u8WXpG2IuVGII1m/OpJZ9hxlEolsxf1mzYBXQix7Tmzmr2O
 nv4BwXLLikP26Wpbh/JZUTrTAkvsuLQs/TsCjCOE2SgSREV2HYcVvIg0ZaSYICeVEKeScyo7V
 zXV/8sohw8kL1mt6R32WTNfhuhCXFFl8gYuVx2bwp7pU05kk7ntMOmIeuNdiVQTOZuuiGCl2f
 vCvhn86h0axxSfUiEwbbJHeilAddAzpnz/NoMplV7Ti4EyTNaxmxCZSZB4QlEAbG80fPUYsqH
 l/8qPdEdSu3g26eg4h/DUKKKe6llziMAwu7D824vkEPjap9vn+zu4isl78ebbWobu+ftmBp/W
 Q46Pi9zRt7dLZ4jLLz8/20dwtmqUnJpbcqS8esq6p6NvFaaR9FL4+6GbYL3vLNycEWC0B05Wm
 oQvlcqUyY1UBYVGHYfhhYkchUkekOO7zKXk9yjLON+NwecSp7JzJ9eDZO/TSC9iS3LuG0F4lx
 c2/ch7kw/Bjklne8uHLgliMSa5l1z5GSdFwxysB/r0zwBXNMFpYGuKzfV4oqzAnHudm5dYaVW
 cFhbEKi+3Sgano5I9b8pexGxuSBYmd7WT6cuWjwt9uD4T8ZOj3JngkbYrLvJEHbZIfE30Tmlw
 mhju7wtTOOWgJUnbQT+YU1lvB5mOtPrSuth2DZhv/qMBEflC+rTofykEtVVvkblD1+78mEJTV
 fbZ4vPOOLpDb19KE2Njz6KaqIOMsp5VqjAVK/wfd+i29hDH5sQyzDwlafkMc=
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH] parsing_c: Handle case
	of macro before typedef
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

PiBBIGNhc2UgaW4gcGFyc2luZ19oYWNrcy5tbCBzb21ldGltZXMgbWlzbGFiZWxzIDxtYWNybz4g
YXMgYQo+IHR5cGVkZWYgaWRlbnQuCgpDYW4gYSB3b3JkaW5nIGxpa2Ug4oCcYXMgYSB0eXBlIGRl
ZmluaXRpb24gaWRlbnRpZmllcuKAnSBiZSBuaWNlcgpmb3IgdGhpcyBkZXNjcmlwdGlvbiBvZiBh
IHNvZnR3YXJlIHNpdHVhdGlvbj8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
