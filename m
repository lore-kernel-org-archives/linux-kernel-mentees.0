Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96169C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 11:51:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C30422226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 11:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuZksbDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C30422226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A380A86B33;
	Sat, 21 Nov 2020 11:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCiIVxJAGgUj; Sat, 21 Nov 2020 11:50:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FCC086EB4;
	Sat, 21 Nov 2020 11:50:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83146C163C;
	Sat, 21 Nov 2020 11:50:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 490DBC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16CFE86E9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1b73U3YSXfhm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:50:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3ACC386B33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:50:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y22so6334350plr.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=84ayGdyMy9/CMyxg2boT2AM+rRZOX/cQEK+WefQ2g/4=;
 b=QuZksbDgMjiA5TmkKkRV7AHpwtsdiivSs1QIiKM7vWidWCFBElPQ8b6S1x8LzpWxyq
 Uw/s3sJeUhBL2WNmdXrIKD3pVvA8RrReWnKTvrCf9e0jL3Eldi3VWHVY0EzqKVwLVSKK
 UTlTRA92Yt84is7MsP7aIMwqS/KWXjFH7YiYltzJlplMa7ZsDBTttREhRc9UCeEBX++F
 afEY1N7+i51wec6xqVFxchmFNKQXfgsACJtB8+WoeJq/di/niBEJU/F+yNc0eDMVMXsa
 TYj1jPk8NMmxsP9TvEJQwxPUJlJxIlDvAmJUrN2H8PgB7T6scMrzjLgSCS2aIC/f421M
 luWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=84ayGdyMy9/CMyxg2boT2AM+rRZOX/cQEK+WefQ2g/4=;
 b=pj7TrV1sGwXJe/OSxpiUaOtru1gPOPLggKoaGPgy1DqAhMB+YLoHFXIqo48B/TzdxI
 V1YnixXHnTo3w+mbLAwsyRbebYdlLXtrZiIv4a/mK7K3QBUGwpKK7rPiIBqhy1Jjr+mS
 iRBdJC7SMU0ip3oIR3k0wUQbDtraNt8Z1rxdk041QXNu+Q6WhcIBNdk520Bp897vbGJU
 2jHOShJgnz3rFIeyy+ewAh2jyjZ0h+TktEn9769N/XstGUQIROP+V2s9wlQ31kcraSMV
 juCuqN2AnKRAUNMqZQ9g5MEzQ2y3aIEhYHwZE1PVHwqpsfIPt09tH7btcCHGPquImR9f
 HN2g==
X-Gm-Message-State: AOAM531DBKs4meMRWc4gxEhqMZcefHAwE/Vj5Tp3lGsdumC2V1TuJWZw
 CrHqgjGVvO7Yj6OACyYH5kI=
X-Google-Smtp-Source: ABdhPJx11SQAjLXEas3HcY7jPIA/q5sldcz5fjkNIjhB566JHKZCc/GZY3O41glg1xssxJKdbNAlyg==
X-Received: by 2002:a17:902:9a84:b029:d9:d5ad:a669 with SMTP id
 w4-20020a1709029a84b02900d9d5ada669mr12858444plp.53.1605959456673; 
 Sat, 21 Nov 2020 03:50:56 -0800 (PST)
Received: from ?IPv6:2402:3a80:400:4498:ed91:20bf:333c:1bc4?
 ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.gmail.com with ESMTPSA id t7sm7363754pji.27.2020.11.21.03.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 03:50:56 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Joe Perches <joe@perches.com>
References: <20201117171856.13284-1-yashsri421@gmail.com>
 <48f56f40-a365-faac-542d-0e120fcf4365@gmail.com>
 <08f164e93dc40e066e81c4021485d27d5ad5a6b7.camel@perches.com>
 <6deacf63-a80f-67b5-0594-e5cb5e82f42b@gmail.com>
Message-ID: <1d7692d0-359f-6b6a-32d4-1627ebd8b100@gmail.com>
Date: Sat, 21 Nov 2020 17:20:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6deacf63-a80f-67b5-0594-e5cb5e82f42b@gmail.com>
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

T24gMjAvMTEvMjAgMTE6MzIgcG0sIEFkaXR5YSB3cm90ZToKPiBPbiAyMC8xMS8yMCAxMDo1NiBw
bSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+IE9uIEZyaSwgMjAyMC0xMS0yMCBhdCAxNjoxMSArMDUz
MCwgQWRpdHlhIHdyb3RlOgo+Pj4gT24gMTcvMTEvMjAgMTA6NDggcG0sIEFkaXR5YSBTcml2YXN0
YXZhIHdyb3RlOgo+Pj4+IEN1cnJlbnRseSwgY2hlY2twYXRjaCB3YXJucyB1cyBpZiBhbiBhc3Np
Z25tZW50IG9wZXJhdG9yIGlzIHBsYWNlZAo+Pj4+IGF0IHRoZSBzdGFydCBvZiBhIGxpbmUgYW5k
IG5vdCBhdCB0aGUgZW5kIG9mIHByZXZpb3VzIGxpbmUuCj4+Pj4KPj4+PiBFLmcuLCBydW5uaW5n
IGNoZWNrcGF0Y2ggb24gY29tbWl0IDgxOTViMTM5NmVjOCAoImh2X25ldHZzYzogZml4Cj4+Pj4g
ZGVhZGxvY2sgb24gaG90cGx1ZyIpIHJlcG9ydHM6Cj4+Pj4KPj4+PiBDSEVDSzogQXNzaWdubWVu
dCBvcGVyYXRvciAnPScgc2hvdWxkIGJlIG9uIHRoZSBwcmV2aW91cyBsaW5lCj4+Pj4gKwlzdHJ1
Y3QgbmV0dnNjX2RldmljZSAqbnZkZXYKPj4+PiArCQk9IGNvbnRhaW5lcl9vZih3LCBzdHJ1Y3Qg
bmV0dnNjX2RldmljZSwgc3ViY2hhbl93b3JrKTsKPj4+Pgo+Pj4+IFByb3ZpZGUgYSBzaW1wbGUg
Zml4IGJ5IGFwcGVuZGluZyBhc3NpZ25tZW50IG9wZXJhdG9yIHRvIHRoZSBwcmV2aW91cwo+Pj4+
IGxpbmUgYW5kIHJlbW92aW5nIGZyb20gdGhlIGN1cnJlbnQgbGluZSwgaWYgYm90aCB0aGUgbGlu
ZXMgYXJlIGFkZGl0aW9ucwo+Pj4+IChpZSBzdGFydCB3aXRoICcrJykKPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFkaXR5YSBTcml2YXN0YXZhIDx5YXNoc3JpNDIxQGdtYWlsLmNvbT4KPj4+PiAt
LS0KPj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4+IGFkZCBjaGVjayBpZiBib3RoIHRoZSBsaW5lcyBh
cmUgYWRkaXRpb25zIChpZSBzdGFydCB3aXRoICcrJykKPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjM6
Cj4+Pj4gcXVvdGUgJG9wZXJhdG9yOyB0ZXN0IHdpdGggZGl2aXNpb24gYXNzaWdubWVudCBvcGVy
YXRvciAoJy89JykKPj4+Pgo+Pj4+IMKgc2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgMTAgKysrKysr
KystLQo+Pj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwKPj4+PiBpbmRleCBjOWFhYWE0NDMyNjUuLmQ1YmM0ZDhlNGY2YyAxMDA3
NTUKPj4+PiAtLS0gYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKPj4+PiArKysgYi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwKPj4+PiBAQCAtMzU0Miw4ICszNTQyLDE0IEBAIHN1YiBwcm9jZXNzIHsKPj4+
PiDCoAo+Pj4+Cj4+Pj4gwqAjIGNoZWNrIGZvciBhc3NpZ25tZW50cyBvbiB0aGUgc3RhcnQgb2Yg
YSBsaW5lCj4+Pj4gwqAJCWlmICgkc2xpbmUgPX4gL15cK1xzKygkQXNzaWdubWVudClbXj1dLykg
ewo+Pj4+IC0JCQlDSEsoIkFTU0lHTk1FTlRfQ09OVElOVUFUSU9OUyIsCj4+Pj4gLQkJCSAgICAi
QXNzaWdubWVudCBvcGVyYXRvciAnJDEnIHNob3VsZCBiZSBvbiB0aGUgcHJldmlvdXMgbGluZVxu
IiAuICRoZXJlcHJldik7Cj4+Pj4gKwkJCW15ICRvcGVyYXRvciA9ICIkMSI7Cj4+Pj4gKwkJCWlm
IChDSEsoIkFTU0lHTk1FTlRfQ09OVElOVUFUSU9OUyIsCj4+Pj4gKwkJCQkiQXNzaWdubWVudCBv
cGVyYXRvciAnJDEnIHNob3VsZCBiZSBvbiB0aGUgcHJldmlvdXMgbGluZVxuIiAuICRoZXJlcHJl
dikgJiYKPj4+PiArCQkJICAgICRmaXggJiYgJHByZXZyYXdsaW5lID1+IC9eXCsvKSB7Cj4+Pj4g
KwkJCQkjIGFkZCBhc3NpZ25tZW50IG9wZXJhdG9yIHRvIHRoZSBwcmV2aW91cyBsaW5lLCByZW1v
dmUgZnJvbSBjdXJyZW50IGxpbmUKPj4+PiArCQkJCSRmaXhlZFskZml4bGluZW5yIC0gMV0gLj0g
IiAkb3BlcmF0b3IiOwo+Pj4+ICsJCQkJJGZpeGVkWyRmaXhsaW5lbnJdID1+IHMvJG9wZXJhdG9y
XHMqLy87Cj4+Pj4gKwkJCX0KPj4+PiDCoAkJfQo+Pj4+IMKgCj4+Pj4KPj4+PiDCoCMgY2hlY2sg
Zm9yICYmIG9yIHx8IGF0IHRoZSBzdGFydCBvZiBhIGxpbmUKPj4+Pgo+Pj4KPj4+IEhpIEpvZQo+
Pj4gVGhpcyBwYXRjaCBwcm9iYWJseSBnb3QgbWlzc2VkLiBQbGVhc2UgcmV2aWV3IDopCj4+Cj4+
IERpZCB5b3UgbG9vayBhdCAkQXNzaWdubWVudD8gIERpZCB5b3Ugc2VlIGl0IGNhbiBiZSAvPSA/
Cj4+Cj4gCj4gWWVzLCBJIHRlc3RlZCB0aGUgcGF0Y2ggd2l0aCAnLz0nIG9wZXJhdG9yIGFzIHdl
bGwuCj4gQXMgSSBjb3VsZCBub3QgZmluZCBhbnkgb2NjdXJyZW5jZXMgaW4gdGhlIHBhc3Qob3Zl
ciA0LjEzLi41LjgpLCBJCj4gY3JlYXRlZCBhbiBleGFtcGxlIGZvciBteXNlbGYgYnkgbW9kaWZ5
aW5nIHRoZSBhYm92ZSBtZW50aW9uZWQgY29tbWl0Cj4gZXhhbXBsZSBpLmUuIGNvbW1pdCA4MTk1
YjEzOTZlYzggKCJodl9uZXR2c2M6IGZpeCBkZWFkbG9jayBvbgo+IGhvdHBsdWciKSBhczoKPiAK
PiArCXN0cnVjdCBuZXR2c2NfZGV2aWNlICpudmRldgo+ICsJCS89IGNvbnRhaW5lcl9vZih3LCBz
dHJ1Y3QgbmV0dnNjX2RldmljZSwgc3ViY2hhbl93b3JrKTsKPiAKPiBbRm9yIExpbmUgMTQ0IGFu
ZCAxNDUod2hlcmUgdGhlIHdhcm5pbmcgd2FzIHJlcG9ydGVkIGZvciAnPScgZWFybGllcildCj4g
Cj4gVGhlIGZpeCBjaGFuZ2VzIHRoZXNlIGxpbmVzIHRvOgo+ICsJc3RydWN0IG5ldHZzY19kZXZp
Y2UgKm52ZGV2IC89Cj4gKwkJY29udGFpbmVyX29mKHcsIHN0cnVjdCBuZXR2c2NfZGV2aWNlLCBz
dWJjaGFuX3dvcmspOwo+IAo+IE9uIHJldGVzdGluZyB0aGUgcGF0Y2ggd2l0aCBjaGVja3BhdGNo
LnBsLCBpdCBkaWQgbm90IGdpdmUgdGhpcyBDSEVDSywKPiBub3IgZGlkIHdlIGFkZCBhbnkgbmV3
IHdhcm5pbmcvZXJyb3IuCj4gCj4+IElmIGl0IGlzLCB3aGF0IGhhcHBlbnMgaW4gdGhlICRmaXhl
ZFskZml4bGluZW5yXSBsaW5lPwo+Pgo+IAo+IEluICRmaXhlZFskZml4bGluZW5yXSwgd2UgYXJl
IGp1c3QgZ2V0dGluZyByaWQgb2YgdGhlIG9wZXJhdG9yIGFuZCBhbnkKPiBzcGFjZShzKSBmb2xs
b3dpbmcgaXQuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCgpJIHRoaW5rIEkgdW5kZXJzdG9v
ZCBxdW90aW5nIGluY29ycmVjdGx5IGhlcmUuIEkgaGFkIHRvIHVzZSBcUS4KSSdsbCByZXNlbmQg
dGhlIG1vZGlmaWVkIHBhdGNoIHdpdGggZGVzaXJlZCBjaGFuZ2VzLgpTb3JyeSBmb3IgaW5jb252
ZW5pZW5jZS4KClRoYW5rcwpBZGl0eWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
