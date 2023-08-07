Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0D0C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 15:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9768146E;
	Mon,  7 Aug 2023 15:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9768146E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pKLMs5PP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGuVBXVk2VUU; Mon,  7 Aug 2023 15:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 64A5780B18;
	Mon,  7 Aug 2023 15:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64A5780B18
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C5F7C0072;
	Mon,  7 Aug 2023 15:31:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2696C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E80414DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E80414DE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pKLMs5PP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fK1-92z9mHRN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:31:19 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7815D402D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 15:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7815D402D2
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55fcc15e109so2495634a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691422279; x=1692027079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3t3bqscy3WQ1ZHKk3TawW56eOEGzmCU0ozcUehoKFHA=;
 b=pKLMs5PPUdYnsVBRcQvcO/gGgACELGYHtTOxCivbG/vNNRL8C6dEQHNBxEtvpdt9ba
 WDM0VjO6PHZnV2pPhZKsHTJGG+16s84WYxx9oH6JUzt+52uuepl3PQ0IYqQX5w7WAHqw
 y7dQaIc+Yn3btbjqS7EIg/W1XBpxz+QHkHr8duU10NCRSwEI3MrCw0geG1qTsPWMb6JW
 Tpp/ftlkRoSqxLVY4803C0FV1YGqlFbVlZiMRf2Q47YUoOeCsuyRNmOQv77RJ7e2BLX3
 IEhi0Te6MdQa00HkheuIBRQ/7oIMFZmgkthgel8s6iwcYubiFROktUrpgHDVpXQ8lpy1
 izzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691422279; x=1692027079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3t3bqscy3WQ1ZHKk3TawW56eOEGzmCU0ozcUehoKFHA=;
 b=KJ3NtRvBjxxchhUSKL4X9m8sr4EQgFgWHGB7GAILjz76ug6Jbsc5f6wbzDZXoT08vZ
 X4xcrye82qAeTo9GS5fH4mBcFp+K1ATm2nwMPjKvBcSK6OlOLtDfRzugOQKROuXvrh+r
 44wTK//L+hoGjVIDepNUma79Qao3odskmUhJhpOJ95sNKtJCSuVrdCdsLH2CfHMKOpIv
 7tOQBDxmRVsx9I292xKfUffGR7+NI+wNSimhs3xay2yesGRXEClsMs8Z/KoQB2mj/4Yc
 nh8mlfTglSjso5U3bys6vccWcNLkmdLVDpuLfWu8lPdr0smse2QaAl/jTLdE0iVDJVI8
 +tWw==
X-Gm-Message-State: AOJu0Yw4jeVP2/hjUF19IeG08DNQoLP8NEmNT3oAc65Q82XsKH7moHC6
 UFzHkRgqvUgO+u7r/lGSWfo=
X-Google-Smtp-Source: AGHT+IFyhr6u9s2soovfCRmnzc495lIpnL12W6fHEvmBCbeMhZnZX++395CTXDeyds1tePQluIef2Q==
X-Received: by 2002:a17:90a:4587:b0:269:155a:c936 with SMTP id
 v7-20020a17090a458700b00269155ac936mr7287464pjg.28.1691422278647; 
 Mon, 07 Aug 2023 08:31:18 -0700 (PDT)
Received: from ?IPV6:2601:204:df00:9cd0::c121? ([2601:204:df00:9cd0::c121])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a17090add9300b0026596b8f33asm8861465pjv.40.2023.08.07.08.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 08:31:18 -0700 (PDT)
Message-ID: <7fab4b8b-5809-49d1-a7cc-2c93bb2bbda1@gmail.com>
Date: Mon, 7 Aug 2023 08:31:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath6kl: replace one-element array with flexible-array
 member
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Greg KH <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>
References: <20230804045554.6934-1-rauji.raut@gmail.com>
 <2023080433-patio-staining-2cfe@gregkh> <87sf8zs2oi.fsf@kernel.org>
 <2023080410-unadorned-vertigo-c0b8@gregkh>
 <47f1a06b-8bfe-911a-3a05-da7d522b588f@quicinc.com>
Content-Language: en-US
From: Atul Raut <rauji.raut@gmail.com>
In-Reply-To: <47f1a06b-8bfe-911a-3a05-da7d522b588f@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CkNvbnNpZGVyaW5nIGV2ZXJ5b25lJ3MgaW5wdXQvY29tbWVudHMsIHdpbGwgcmVmcmFpbiBmcm9t
IGFsdGVyaW5nIHRoaXMgb3IKCm90aGVyIHN1Ym1pdHRlZCBwYXRjaGVzLCBhcyBhZHZpc2VkLgoK
LUF0dWwKCk9uIDgvNy8yMyAwNzoxMywgSmVmZiBKb2huc29uIHdyb3RlOgo+IE9uIDgvNC8yMDIz
IDI6MzAgQU0sIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDA0LCAyMDIzIGF0IDEwOjEw
OjM3QU0gKzAzMDAsIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiBHcmVnIEtIIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JpdGVzOgo+Pj4KPj4+PiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAw
OTo1NTo1NFBNIC0wNzAwLCBBdHVsIFJhdXQgd3JvdGU6Cj4+Pj4KPj4+Pj4gT25lLWVsZW1lbnQg
YXJyYXlzIGFyZSBubyBsb25nZXIgcmVsZXZhbnQsIGFuZCB0aGVpcgo+Pj4+PiBwbGFjZSBoYXMg
YmVlbiB0YWtlbiBieSBmbGV4aWJsZSBhcnJheSBtZW1iZXJzIHRodXMsCj4+Pj4+IHVzZSBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciB0byByZXBsYWNlIHRoZSBvbmUtZWxlbWVudAo+Pj4+PiBhcnJh
eSBpbiBzdHJ1Y3QgYXRoNmtsX3VzYl9jdHJsX2RpYWdfY21kX3dyaXRlCj4+Pj4+Cj4+Pj4+IFRo
aXMgZml4ZXMgd2FybmluZ3Mgc3VjaCBhczoKPj4+Pj4gLi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoNmtsL3VzYi5jOjEwOTo4LTEyOiBXQVJOSU5HIHVzZSAKPj4+Pj4gZmxleGlibGUtYXJy
YXkgbWVtYmVyIGluc3RlYWQgCj4+Pj4+IChodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1l
bnQtYXJyYXlzKQo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBdHVsIFJhdXQgPHJhdWppLnJh
dXRAZ21haWwuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDZrbC91c2IuYyB8IDIgKy0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoNmtsL3VzYi5jIAo+Pj4+PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGg2a2wvdXNiLmMKPj4+Pj4gaW5kZXggNTIyMDgwOTg0MWE2Li5jOGVjYzllODU4OTcgMTAw
NjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg2a2wvdXNiLmMKPj4+
Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDZrbC91c2IuYwo+Pj4+PiBAQCAt
MTA2LDcgKzEwNiw3IEBAIHN0cnVjdCBhdGg2a2xfdXNiX2N0cmxfZGlhZ19jbWRfd3JpdGUgewo+
Pj4+PiDCoMKgwqDCoMKgIF9fbGUzMiBjbWQ7Cj4+Pj4+IMKgwqDCoMKgwqAgX19sZTMyIGFkZHJl
c3M7Cj4+Pj4+IMKgwqDCoMKgwqAgX19sZTMyIHZhbHVlOwo+Pj4+PiAtwqDCoMKgIF9fbGUzMiBf
cGFkWzFdOwo+Pj4+PiArwqDCoMKgIF9fbGUzMiBfcGFkW107Cj4+Pj4KPj4+PiBBcmUgeW91IHN1
cmUgdGhpcyBpcyBhY3R1YWxseSBhIHZhcmlhYmxlIGxlbmd0aCBhcnJheT8KPj4+Cj4+PiBJdCdz
IG5vdCwgaXQncyBqdXN0IHBhZGRpbmcuIFdlIGJvdGggdG9sZCB0aGlzIGluIHYxOgo+Pj4KPj4+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRj
aC8yMDIzMDczMTAxMjk0MS4yMTg3NS0xLXJhdWppLnJhdXRAZ21haWwuY29tLyAKPj4+Cj4+Cj4+
IEhleSwgSSdtIGNvbnNpc3RlbnQsIG5pY2UhwqAgOikKPj4KPj4gQnV0IEF0dWwsIHRoYXQncyBu
b3QgZ29vZCB0byBpZ25vcmUgb3VyIHJldmlldyBjb21tZW50cy4gVXN1YWxseSB0aGF0Cj4+IGVu
ZHMgdXAgbWVhbmluZyB0aGF0IGV2ZXJ5b25lIHdpbGwgdGhlbiBqdXN0IGlnbm9yZSB5b3VyIHN1
Ym1pc3Npb25zLAo+PiBnZW5lcmFsbHkgYSBub3QtZ29vZCByZXNvbHV0aW9uLgo+Pgo+PiB0aGFu
a3MsCj4+Cj4+IGdyZWcgay1oCj4KPiBTaW5jZSB0aGUgJ3BhZCcgZmllbGQgaXMgbmV2ZXIgZGly
ZWN0bHkgYWNjZXNzZWQsIHN1Z2dlc3QgdGhlIGF1dGhvciAKPiByZXNwaW4gdGhpcyB0aGlzIHRv
IHVzZSBzaW1wbHk6Cj4gwqDCoMKgwqBfX2xlMzIgX3BhZDsKPgo+IFRoYXQgd2lsbCBwcmV2ZW50
IG90aGVycyBmcm9tIHRyeWluZyB0byAiZml4IiB0aGlzIGFjdHVhbCBvbmUtZWxlbWVudCAKPiBh
cnJheSBpbiB0aGUgZnV0dXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
