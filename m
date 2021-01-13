Return-Path: <SRS0=tgA/=GQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F66CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jan 2021 17:11:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F7B233F6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jan 2021 17:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F7B233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31FFD868AB;
	Wed, 13 Jan 2021 17:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UD16vJRjwdTd; Wed, 13 Jan 2021 17:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BDD6868A8;
	Wed, 13 Jan 2021 17:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59E59C0893;
	Wed, 13 Jan 2021 17:11:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61F78C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 17:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4E44E2A16D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 17:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXun+xLQWRY1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 17:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by silver.osuosl.org (Postfix) with ESMTPS id C942220401
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 17:11:16 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id c12so1602346pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CSMr4NhVemQaIQlRzEmh9o0jMB/AHGUZGs2K3OynXQQ=;
 b=dd6LYrFnIW5RxpTT32/eQgDrjB4n+aPvbv9213hbMjGz9T31yfSsm3+S40KperD5L6
 qobfcZwzN39qpnwhUB3KEFCjH0nJNIDCKqA5+7rN/f9Eb2BdP6L9W+/emmKe1f0xmYl+
 sn0Hg9DEjRxA5isINJcX9+NZ+BCuV0hu1mxtnimyi6Xy2mEOklSDawskgjXv4j+M+aFL
 eC5yf8DoiUF6Sw1zSGwmaAEjOhCebnloFbiB3voItJWmxpVoA+q8+aUqRf2bdJc+MN06
 vahgq8yK1BTFkfcqyy8YGoT2LYK9pSKhQvQUqA21KGvEArnxgVRztgNE5ndaPbfTrGm2
 l0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CSMr4NhVemQaIQlRzEmh9o0jMB/AHGUZGs2K3OynXQQ=;
 b=QXX0jORXFiUOpNV955VS2lBDBrVoqvDBEx5V1xOZh8Cag7dOZxlCfSOlGp1UReGAt0
 Zy3y6U7oMa2WZgWrxQNpwxxAgh+NsCdXTct6cPOKIuMc9uN0H/bK/xZ9ZdaxaSjjvyVN
 6MISQpGf6TivTPgYkmrdUVpeyMyfp7WierEA1i2v8JMDN/TjF+IGhwQyZKJ6L1A4/MFH
 Q48mHzMfNiT5V+9k/lrmRB7rDTpvackL1vvLYw4YDd+MeztGcgKu208oJtIpwIYc/Ncj
 P1P52D9GB7nMNkhSNBq+9jZup5fH8kKMmtRXRnj1JlEmS3A9JM8iXbGF5lgV5LVQP1zI
 AZKQ==
X-Gm-Message-State: AOAM530caBysEDABK+c5wGo5x3DtlSVl78/ukTBEkFDBgW+lv4ostGpq
 M+mBRTRKGNQweX6XwUem3BQ=
X-Google-Smtp-Source: ABdhPJwRqH7PxlXkGYdfi1mlufm1W/jmCyvwbun7hVgpPo4l7c2GM/tq91sAkcfCqgTMg1v/q9vrXw==
X-Received: by 2002:a62:1716:0:b029:19d:b78b:ef02 with SMTP id
 22-20020a6217160000b029019db78bef02mr3061335pfx.11.1610557876283; 
 Wed, 13 Jan 2021 09:11:16 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:2476:46d6:e655:45d9?
 ([2405:201:600d:a089:2476:46d6:e655:45d9])
 by smtp.gmail.com with ESMTPSA id b5sm3585016pga.54.2021.01.13.09.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 09:11:15 -0800 (PST)
To: Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org
References: <20210108153208.24065-1-yashsri421@gmail.com>
 <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
From: Aditya <yashsri421@gmail.com>
Message-ID: <37f9fb2c-56bb-b593-ae55-db8fce8304f9@gmail.com>
Date: Wed, 13 Jan 2021 22:41:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3c121981-1468-fc9d-7813-483246066cc4@lwfinger.net>
Content-Language: en-US
Cc: pkshih@realtek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, kvalo@codeaurora.org
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: net: wireless: rtlwifi:
 fix bool comparison in expressions
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

T24gOS8xLzIxIDE6MTEgYW0sIExhcnJ5IEZpbmdlciB3cm90ZToKPiBPbiAxLzgvMjEgOTozMiBB
TSwgQWRpdHlhIFNyaXZhc3RhdmEgd3JvdGU6Cj4+IFRoZXJlIGFyZSBjZXJ0YWluIGNvbmRpdGlv
bmFsIGV4cHJlc3Npb25zIGluIHJ0bHdpZmksIHdoZXJlIGEgYm9vbGVhbgo+PiB2YXJpYWJsZSBp
cyBjb21wYXJlZCB3aXRoIHRydWUvZmFsc2UsIGluIGZvcm1zIHN1Y2ggYXMgKGZvbyA9PSB0cnVl
KSBvcgo+PiAoZmFsc2UgIT0gYmFyKSwgd2hpY2ggZG9lcyBub3QgY29tcGx5IHdpdGggY2hlY2tw
YXRjaC5wbCAoQ0hFQ0s6Cj4+IEJPT0xfQ09NUEFSSVNPTiksIGFjY29yZGluZyB0byB3aGljaCBi
b29sZWFuIHZhcmlhYmxlcyBzaG91bGQgYmUKPj4gdGhlbXNlbHZlcyB1c2VkIGluIHRoZSBjb25k
aXRpb24sIHJhdGhlciB0aGFuIGNvbXBhcmluZyB3aXRoIHRydWUvZmFsc2UKPj4KPj4gRS5nLiwg
aW4gZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGx3aWZpL3BzLmMsCj4+ICJpZiAoZmlu
ZF9wMnBfaWUgPT0gdHJ1ZSkiIGNhbiBiZSByZXBsYWNlZCB3aXRoICJpZiAoZmluZF9wMnBfaWUp
Igo+Pgo+PiBSZXBsYWNlIGFsbCBzdWNoIGV4cHJlc3Npb25zIHdpdGggdGhlIGJvb2wgdmFyaWFi
bGVzIGFwcHJvcHJpYXRlbHkKPj4KPj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIFNyaXZhc3RhdmE8
eWFzaHNyaTQyMUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAtIFRoZSBjaGFuZ2VzIG1hZGUgYXJlIGNv
bXBpbGUgdGVzdGVkCj4+IC0gQXBwbGllcyBwZXJmZWNseSBvbiBuZXh0LTIwMjEwMTA4Cj4+Cj4+
IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9wcy5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICsrLS0KPj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3Mv
cmVhbHRlay9ydGx3aWZpL3J0bDgxODhlZS9kbS5jwqDCoMKgwqDCoMKgIHwgOAo+PiArKysrLS0t
LQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bHdpZmkvcnRsODE4OGVlL2h3
LmPCoMKgwqDCoMKgwqAgfCA0ICsrLS0KPj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRl
ay9ydGx3aWZpL3J0bDgxOTJjL2RtX2NvbW1vbi5jIHwgNCArKy0tCj4+IMKgIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9ydGw4MTkyc2UvaHcuY8KgwqDCoMKgwqDCoCB8IDQg
KystLQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bHdpZmkvcnRsODgyMWFl
L3BoeS5jwqDCoMKgwqDCoCB8IDgKPj4gKysrKy0tLS0KPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBBcyBoYXMgYmVlbiBzdGF0ZWQg
c2V2ZXJhbCB0aW1lcywgdGhpcyBmb3JtIG9mIHRoZSBzdWJqZWN0IGlzCj4gaW5jb3JyZWN0LiBJ
dCBzaG91bGQgYmU6ICJydGx3aWZpOiA8ZHJpdmVyX25hbWU+OiA8c3ViamVjdD4KPiAKPiBJIHdv
dWxkIHByZWZlciB0aGF0IHRoZXJlIGJlIHNlcGFyYXRlIHBhdGNoZXMgZm9yIGVhY2ggZHJpdmVy
LCBub3QKPiB0aGF0IHRoZSBjaGFuZ2VzIGJlIGx1bXBlZCBpbnRvIGEgc2luZ2xlIHBhdGNoIGFz
IHdhcyBkb25lIGhlcmUuIFN1Y2gKPiBvcmdhbml6YXRpb24gbWFrZXMgaXQgYSBsb3QgZWFzaWVy
IHRvIGZpbmQgdGhlIHBhdGNoZXMgZm9yIGEgZ2l2ZW4KPiBkcml2ZXIgaW4gY2FzZSBzb21ldGhp
bmcgZ29lcyB3cm9uZy5Ob3RlOiBUaGUgZHJpdmVyIGZvciBwcyBpcwo+IHJ0bF9wY2ksIGFuZCB0
aGF0IGZvciBydGw4MTkyYyBpcyBydGw4MTkyYy1jb21tb24uIFRoZSBvdGhlciBkcml2ZXIKPiBu
YW1lcyBtYXRjaCB0aGVpciBkaXJlY3RvcnkuCj4gCj4gTGFycnkKPiAKCkhpIExhcnJ5IQpJIHNl
bnQgdGhlIG1vZGlmaWVkIHBhdGNoZXMgYXMgcGF0Y2ggc2VyaWVzIHNlcGFyYXRlbHkuCkkgcHJv
YmFibHkgbWlzc2VkIENDaW5nIHlvdSA6LwoKVGhlIHBhdGNoIHNlcmllcyBjYW4gYmUgZm91bmQg
YXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNzLzIwMjEwMTEwMTIxNTI1
LjI0MDctMS15YXNoc3JpNDIxQGdtYWlsLmNvbS8jdAoKUGxlYXNlIHJldmlldyA6KQoKVGhhbmtz
CkFkaXR5YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
