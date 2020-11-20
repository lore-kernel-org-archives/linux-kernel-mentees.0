Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F9EC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 18:02:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398E12240B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 18:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anUMddH1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398E12240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B34D187644;
	Fri, 20 Nov 2020 18:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7P2I3jfMhjii; Fri, 20 Nov 2020 18:02:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 399DE8764B;
	Fri, 20 Nov 2020 18:02:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22BA1C1825;
	Fri, 20 Nov 2020 18:02:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE26C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 77836872D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVjUwhMck-bN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 18:02:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ABB19872C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 18:02:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i13so7922411pgm.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pi314qbACkjvb24O5TOH5mgSNjJFBx6zBuaW1GBgOBw=;
 b=anUMddH1t++aHeatBjzyWQq6MC3KcPFQxcSP0boTBtJ1Wf8V8zxkpr9PANfBJ7nuXA
 iy323bWUVOhNqEj33fQ3duFIF7Z0s4nI12XRaYbXvet1AmLNdWAI6sGCTpCoAPf9za+E
 TX6tmnT0QipCiXBBfml6V8jVo88QHDO67A5yupSqyiSExAh6HBrDuwSYuBr2r6JEImvh
 u9fdM1PQcrrkpH4DRvZ9Jr7OF06Wh58Rv8wJ+2hunkuGfC57xLm8bGPKngYpP6NGBYp8
 2nAiUdId0sye5vi5QuDn4c2JvdPbm+Al0+VF4ceJdPrGh02TQRPkz7IgxhZOtfQr6ieK
 yudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pi314qbACkjvb24O5TOH5mgSNjJFBx6zBuaW1GBgOBw=;
 b=LXATdUh2hpTFnwE3h7l9V9Ys3tDg88DCeaTfHMDp+k4NEzgDJvd5yIpbTMGrVM6wY+
 vBDNA6+kSwCINkSUjVS75LTnbvqZVhdCgB2TQbAxqeWiNlnaQmlS9Zq+MtUV/aaak5d9
 BXFS3jc8Qql7LI1qxntt7Mdc5ZXL3n5WJl1d4l8TmEA6zz888OkkWEbhLeA+/J0kmoRs
 UP6w60AJK4CBMjnKqnBit9KEAwH2KPeDpj6Dn3EHGf2TPC18CwemBbQRYlcY/t/ZGt0q
 i9bPatogy6vWde4TopMrcnEanW0TGVJ1DYK6K9vn1w22BAl9k6gLCUMIN8mRZSQt1vhz
 Y4xA==
X-Gm-Message-State: AOAM531PmpLhff8OPPPQ5hsAgVaWwTuZiansE548BWLJQ4L8iqWu3Mb7
 9xv6Ai1G4PC0+ud4HOPH3j0=
X-Google-Smtp-Source: ABdhPJyMU0p+BzlD058jBRxrtiWOLaHeym1uqUUcGQUYH93F6JCRU4jFp0pLuLw2RuC3SktGxcFUAA==
X-Received: by 2002:a17:90a:14e5:: with SMTP id
 k92mr11376797pja.169.1605895343009; 
 Fri, 20 Nov 2020 10:02:23 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:f607:e09e:f6d6:daa6:f3cd?
 ([2402:3a80:415:f607:e09e:f6d6:daa6:f3cd])
 by smtp.gmail.com with ESMTPSA id a12sm4684255pjh.48.2020.11.20.10.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 10:02:22 -0800 (PST)
To: Joe Perches <joe@perches.com>
References: <20201117171856.13284-1-yashsri421@gmail.com>
 <48f56f40-a365-faac-542d-0e120fcf4365@gmail.com>
 <08f164e93dc40e066e81c4021485d27d5ad5a6b7.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6deacf63-a80f-67b5-0594-e5cb5e82f42b@gmail.com>
Date: Fri, 20 Nov 2020 23:32:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <08f164e93dc40e066e81c4021485d27d5ad5a6b7.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
 for ASSIGNMENT_CONTINUATIONS
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

T24gMjAvMTEvMjAgMTA6NTYgcG0sIEpvZSBQZXJjaGVzIHdyb3RlOgo+IE9uIEZyaSwgMjAyMC0x
MS0yMCBhdCAxNjoxMSArMDUzMCwgQWRpdHlhIHdyb3RlOgo+PiBPbiAxNy8xMS8yMCAxMDo0OCBw
bSwgQWRpdHlhIFNyaXZhc3RhdmEgd3JvdGU6Cj4+PiBDdXJyZW50bHksIGNoZWNrcGF0Y2ggd2Fy
bnMgdXMgaWYgYW4gYXNzaWdubWVudCBvcGVyYXRvciBpcyBwbGFjZWQKPj4+IGF0IHRoZSBzdGFy
dCBvZiBhIGxpbmUgYW5kIG5vdCBhdCB0aGUgZW5kIG9mIHByZXZpb3VzIGxpbmUuCj4+Pgo+Pj4g
RS5nLiwgcnVubmluZyBjaGVja3BhdGNoIG9uIGNvbW1pdCA4MTk1YjEzOTZlYzggKCJodl9uZXR2
c2M6IGZpeAo+Pj4gZGVhZGxvY2sgb24gaG90cGx1ZyIpIHJlcG9ydHM6Cj4+Pgo+Pj4gQ0hFQ0s6
IEFzc2lnbm1lbnQgb3BlcmF0b3IgJz0nIHNob3VsZCBiZSBvbiB0aGUgcHJldmlvdXMgbGluZQo+
Pj4gKwlzdHJ1Y3QgbmV0dnNjX2RldmljZSAqbnZkZXYKPj4+ICsJCT0gY29udGFpbmVyX29mKHcs
IHN0cnVjdCBuZXR2c2NfZGV2aWNlLCBzdWJjaGFuX3dvcmspOwo+Pj4KPj4+IFByb3ZpZGUgYSBz
aW1wbGUgZml4IGJ5IGFwcGVuZGluZyBhc3NpZ25tZW50IG9wZXJhdG9yIHRvIHRoZSBwcmV2aW91
cwo+Pj4gbGluZSBhbmQgcmVtb3ZpbmcgZnJvbSB0aGUgY3VycmVudCBsaW5lLCBpZiBib3RoIHRo
ZSBsaW5lcyBhcmUgYWRkaXRpb25zCj4+PiAoaWUgc3RhcnQgd2l0aCAnKycpCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQWRpdHlhIFNyaXZhc3RhdmEgPHlhc2hzcmk0MjFAZ21haWwuY29tPgo+Pj4g
LS0tCj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gYWRkIGNoZWNrIGlmIGJvdGggdGhlIGxpbmVzIGFy
ZSBhZGRpdGlvbnMgKGllIHN0YXJ0IHdpdGggJysnKQo+Pj4KPj4+IENoYW5nZXMgaW4gdjM6Cj4+
PiBxdW90ZSAkb3BlcmF0b3I7IHRlc3Qgd2l0aCBkaXZpc2lvbiBhc3NpZ25tZW50IG9wZXJhdG9y
ICgnLz0nKQo+Pj4KPj4+IMKgc2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgMTAgKysrKysrKystLQo+
Pj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwKPj4+IGluZGV4IGM5YWFhYTQ0MzI2NS4uZDViYzRkOGU0ZjZjIDEwMDc1NQo+Pj4gLS0t
IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsCj4+PiArKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwK
Pj4+IEBAIC0zNTQyLDggKzM1NDIsMTQgQEAgc3ViIHByb2Nlc3Mgewo+Pj4gwqAKPj4+Cj4+PiDC
oCMgY2hlY2sgZm9yIGFzc2lnbm1lbnRzIG9uIHRoZSBzdGFydCBvZiBhIGxpbmUKPj4+IMKgCQlp
ZiAoJHNsaW5lID1+IC9eXCtccysoJEFzc2lnbm1lbnQpW149XS8pIHsKPj4+IC0JCQlDSEsoIkFT
U0lHTk1FTlRfQ09OVElOVUFUSU9OUyIsCj4+PiAtCQkJICAgICJBc3NpZ25tZW50IG9wZXJhdG9y
ICckMScgc2hvdWxkIGJlIG9uIHRoZSBwcmV2aW91cyBsaW5lXG4iIC4gJGhlcmVwcmV2KTsKPj4+
ICsJCQlteSAkb3BlcmF0b3IgPSAiJDEiOwo+Pj4gKwkJCWlmIChDSEsoIkFTU0lHTk1FTlRfQ09O
VElOVUFUSU9OUyIsCj4+PiArCQkJCSJBc3NpZ25tZW50IG9wZXJhdG9yICckMScgc2hvdWxkIGJl
IG9uIHRoZSBwcmV2aW91cyBsaW5lXG4iIC4gJGhlcmVwcmV2KSAmJgo+Pj4gKwkJCSAgICAkZml4
ICYmICRwcmV2cmF3bGluZSA9fiAvXlwrLykgewo+Pj4gKwkJCQkjIGFkZCBhc3NpZ25tZW50IG9w
ZXJhdG9yIHRvIHRoZSBwcmV2aW91cyBsaW5lLCByZW1vdmUgZnJvbSBjdXJyZW50IGxpbmUKPj4+
ICsJCQkJJGZpeGVkWyRmaXhsaW5lbnIgLSAxXSAuPSAiICRvcGVyYXRvciI7Cj4+PiArCQkJCSRm
aXhlZFskZml4bGluZW5yXSA9fiBzLyRvcGVyYXRvclxzKi8vOwo+Pj4gKwkJCX0KPj4+IMKgCQl9
Cj4+PiDCoAo+Pj4KPj4+IMKgIyBjaGVjayBmb3IgJiYgb3IgfHwgYXQgdGhlIHN0YXJ0IG9mIGEg
bGluZQo+Pj4KPj4KPj4gSGkgSm9lCj4+IFRoaXMgcGF0Y2ggcHJvYmFibHkgZ290IG1pc3NlZC4g
UGxlYXNlIHJldmlldyA6KQo+IAo+IERpZCB5b3UgbG9vayBhdCAkQXNzaWdubWVudD8gIERpZCB5
b3Ugc2VlIGl0IGNhbiBiZSAvPSA/Cj4gCgpZZXMsIEkgdGVzdGVkIHRoZSBwYXRjaCB3aXRoICcv
PScgb3BlcmF0b3IgYXMgd2VsbC4KQXMgSSBjb3VsZCBub3QgZmluZCBhbnkgb2NjdXJyZW5jZXMg
aW4gdGhlIHBhc3Qob3ZlciA0LjEzLi41LjgpLCBJCmNyZWF0ZWQgYW4gZXhhbXBsZSBmb3IgbXlz
ZWxmIGJ5IG1vZGlmeWluZyB0aGUgYWJvdmUgbWVudGlvbmVkIGNvbW1pdApleGFtcGxlIGkuZS4g
Y29tbWl0IDgxOTViMTM5NmVjOCAoImh2X25ldHZzYzogZml4IGRlYWRsb2NrIG9uCmhvdHBsdWci
KSBhczoKCisJc3RydWN0IG5ldHZzY19kZXZpY2UgKm52ZGV2CisJCS89IGNvbnRhaW5lcl9vZih3
LCBzdHJ1Y3QgbmV0dnNjX2RldmljZSwgc3ViY2hhbl93b3JrKTsKCltGb3IgTGluZSAxNDQgYW5k
IDE0NSh3aGVyZSB0aGUgd2FybmluZyB3YXMgcmVwb3J0ZWQgZm9yICc9JyBlYXJsaWVyKV0KClRo
ZSBmaXggY2hhbmdlcyB0aGVzZSBsaW5lcyB0bzoKKwlzdHJ1Y3QgbmV0dnNjX2RldmljZSAqbnZk
ZXYgLz0KKwkJY29udGFpbmVyX29mKHcsIHN0cnVjdCBuZXR2c2NfZGV2aWNlLCBzdWJjaGFuX3dv
cmspOwoKT24gcmV0ZXN0aW5nIHRoZSBwYXRjaCB3aXRoIGNoZWNrcGF0Y2gucGwsIGl0IGRpZCBu
b3QgZ2l2ZSB0aGlzIENIRUNLLApub3IgZGlkIHdlIGFkZCBhbnkgbmV3IHdhcm5pbmcvZXJyb3Iu
Cgo+IElmIGl0IGlzLCB3aGF0IGhhcHBlbnMgaW4gdGhlICRmaXhlZFskZml4bGluZW5yXSBsaW5l
Pwo+CgpJbiAkZml4ZWRbJGZpeGxpbmVucl0sIHdlIGFyZSBqdXN0IGdldHRpbmcgcmlkIG9mIHRo
ZSBvcGVyYXRvciBhbmQgYW55CnNwYWNlKHMpIGZvbGxvd2luZyBpdC4KCldoYXQgZG8geW91IHRo
aW5rPwoKVGhhbmtzCkFkaXR5YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
