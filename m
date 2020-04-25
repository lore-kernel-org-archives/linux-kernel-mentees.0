Return-Path: <SRS0=tsT7=6J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15A7C54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 13:42:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827BA20661
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Apr 2020 13:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="Z3m4pAvr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 827BA20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4294E204AA;
	Sat, 25 Apr 2020 13:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zy9HULhpYuAp; Sat, 25 Apr 2020 13:42:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 737922038D;
	Sat, 25 Apr 2020 13:42:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60065C1AE8;
	Sat, 25 Apr 2020 13:42:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 844ABC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 733B587697
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYMEjlSIvc7e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:42:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17864875DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Apr 2020 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587822145;
 bh=RitpEs+n8prdE0usf0zCg9mGZyGqDCMw13BmWwg9tPI=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Z3m4pAvrIt6og8ZWKup2HIhgp7MkgJqG2x9w1mqHUyxuciI8EaO9MqPvZPqVV9BMp
 CuIjXJfRCfYH3QGyorr42KmYIGMruE/yoMYJJZg227mrVXJql27OiCQ/stbVR4E9v2
 2DrPzfbZDntmo5lfHCoXRBdy6qs3O9PVOD3r1ppQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.160.204]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LilYb-1iudsz3aXN-00d1Bo; Sat, 25
 Apr 2020 15:42:24 +0200
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
References: <490913cf-2563-25a5-c977-dadc87da866b@web.de>
 <081e4dc524343830ad7653473e54d86081db807b.camel@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <6ad88a23-8d78-f9c6-1040-ce0cf609ad55@web.de>
Date: Sat, 25 Apr 2020 15:42:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <081e4dc524343830ad7653473e54d86081db807b.camel@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:FHkWnfHHM2ilutkPCWcMF1FhRmq70Admn03fipT9W26Cj1vwzdI
 CPm7YhgoVOuh3CJZmRrweABsaycTGBqP2ry6UKAprsbkwDVXGJVpUAziWW7pCW3bF3NGTxg
 EGldccNn9xpwRZhGs97nxMeLAjMnpiZgq4tcBGfgCruI1HBWrnb0Q5REObA0X6h3huFAVlU
 JrTuIHJLjzZJMxx4sck0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RlGMAfbrvLg=:HAe9gTh0o3Vgd97hYj9JeW
 /urevH6hod9OWYwc30+oxvMXX07sOxqjv4l5x9w3vgEaBkz3LgOPr8qfyeci8Yvy6D9YVh4/M
 idotNbpGa6g23NuMPIANOeuHv7tb2+X1mR8cWpQyzsbaYFF50o5d5ZHMGgCKS9Opp0+fmzPp2
 pW56IG+Rtg7ZyIfqusnyJ75W3z5rOSQXuypgtw8iHf1hyV3TuiQsUL4EqWpItEBtZljKOru44
 FHD9Tn31qmayKHRU/wvY7cVzo1bTkn376OcwLBVFOhO78w+TpiNctigxVXbEPA4LZ9B822j9L
 wmX7OzZILRxDFcPLncKgBKNiHCRKIobfNNwG/Ff641JaxWl7XWt/ovQxAmD5qN0ojYKqZJDvE
 5ztZg3cC5y4CxvmJdT2HwiAXRW0/s+nkd1thJt0/GPv74XtOrxJz68BxwdaCQnF4T1UiSe3S5
 QgFRtExgoM32o6lc/oOq6ITN40ySxf/mYMzTTcGB3B3BT4EMXa0P2VR5kpKaWf2U1JQcj5hwf
 i+iTi/W2krXGoDnNpQA8EVhDHlgSgn9r5Nn2Nez30kiYiN5NwMDh1IVOr8FWgDyGzajeaqM9i
 cFpyPmk9Ds14ZlBekK0KpT12NKD2QozwG/65n9DHKXYRI9A2hmWB/9fzR0CKVrhbM12wcfPrZ
 p9IIAnmpfJubQhQPxOfjzihH5hB9ig6rtwsmGZw5FyIxRQNG86CjT+QlJB2aZeKP/Gt6/z9Jb
 Q2Pdlfrm3Oah/EUjbKQyDjvByXs8YSi2T2uS5yAlRJnOlKfrAz1gRBo601UFcytuluIMEKzFD
 lWCIQbgLHmnJVxppGiq+GA0cJNWo+XVP2Os0MuguG/IwTgRD4sIJNEHjtub25tTHpJpuQbKe9
 HayxV+BSnD4qB/1XlicAR2DLzUw2wkR8D9mLncpgekDm4o24HBr2VdRR86FgwObSV4B4mLHUV
 z9Dz5zZmEe4aQnj1Zx4YMLR84fPpPb4Lb0UmbR2kaTOcp24x1ySoOpDymDsZw/wfvhlg60Hp+
 UppRbZC5nlteaUAyw2zJ63sUomFtd7Isvop0bkg9BCktOQOafjtZtguMurE2nmJCINMo8sg/a
 YWy5WCBCtdez2ZhyK4n99Rg8h9MbzlV3BZivQDDJiwdKlA05qcnfK47Xg5d2zh0Rt5OjjG8x2
 yAw8s4Wn78G+56JjVDWEnnAdTacHOhhtJIga/MicfuDavn3SAXvU8QXByfKFGRqb+slHNdJ0+
 xh12IT2MiA/X+vQCP
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [Cocci] [RFC 00/25] cocci: Improve C
	parsing of attributes
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

Pj4+IFRoZXNlIHBhcnNpbmcgZXJyb3JzIHdlcmUgZGlzY292ZXJlZCBieSBydW5uaW5nIGEgYnVp
bGQgb2YKPj4+IENvY2NpbmVsbGUncwo+Pgo+PiBXb3VsZCB5b3UgbGlrZSB0byBvbWl0IHRoZSB3
b3JkIOKAnFRoZXNl4oCdPwrigKYKPiBDb3VsZCB5b3UgcGxlYXNlIGtlZXAgeW91ciBmZWVkYmFj
ayByZWxldmFudCB0byB0aGUgYWN0dWFsIHBhdGNoIGl0c2VsZgo+IChvciB0aGUgY29tbWl0IG1l
c3NhZ2VzKT8KCkkgY29udHJpYnV0ZWQgYW5vdGhlciByZXZpZXcgY29tbWVudCBhbHNvIGF0IHRo
aXMgcGxhY2UuCgoKPiBGZWVkYmFjayBsaWtlIHRoaXMgcmVhbGx5IGlzbid0IHJlbGV2YW50LCB1
bmxlc3MgdGhlc2UgbWlub3IgdHlwb3MvCj4gZ3JhbW1hcnRpY2FsIGVycm9ycyBjYXVzZSBhIF9s
b3RfIG9mIGNvbmZ1c2lvbi4KCkkgb2NjYXNpb25hbGx5IGRhcmUgdG8gc3VnZ2VzdCBjb3JyZXNw
b25kaW5nIHdvcmRpbmcgZmluZS10dW5pbmcKc28gdGhhdCB0aGUgY2hhbmNlcyBtaWdodCBpbmNy
ZWFzZSB0byBwdWJsaXNoIGltcHJvdmVkIGNvbW1pdHMuCgpSZWdhcmRzLApNYXJrdXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1l
bnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgta2VybmVsLW1lbnRlZXMK
