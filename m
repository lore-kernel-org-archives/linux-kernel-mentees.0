Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA82C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 18:25:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DB822D50
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 18:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DB822D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C154586DAB;
	Sat, 23 Jan 2021 18:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A+OT041bO1pj; Sat, 23 Jan 2021 18:25:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E80A186D19;
	Sat, 23 Jan 2021 18:25:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAA84C08A1;
	Sat, 23 Jan 2021 18:25:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22002C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0624487260
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 18:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkeUSq5ZeS6Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 18:25:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 466D587243
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 18:25:43 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id n25so6142413pgb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IgsmJxNhjM6n7JOSepgWyLYU2D0ed5MSeP1SAOXnnP8=;
 b=E0Be+SNKLKxeZp1olAA15doSY0b2e6N3oQCN5iJ07sOIZUCGohvOwrfj2LzAaW5TUD
 WMOU1Gtfis9fTfYMQfkfZeMj1mU3lvMm1CDGovVBg642EssNONQDGhRYbRwtUSr8hnJy
 uZhOlnHfgrmXZfcskPREbKzLoy9W8HleVFErPyFeWevSefoxdbzg/bLSBArWwWYjeVkm
 V1rXAZOmnxEcpds3ctdGtm/WJHqLvSMJoVZvBUS7CIY8W9/2kk7rdvqeFVKYz8F6RwEJ
 l5MbdKJXV3ZVoxZu2721vqNn0I19lJjGTecavBfLTvnKwVKt2VBBhDJKKgW3WlyC936Y
 HRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IgsmJxNhjM6n7JOSepgWyLYU2D0ed5MSeP1SAOXnnP8=;
 b=PTIjhONkZCR345fA1DZIPQQv4cZUsAFpi+R/TlwtwoHaXU32XIBSI2PbTOqUkbUtlw
 i8Dq9z5BVMhZoOCEwT5jhBGudkJl5bcTlX2bL4ev8TkEE3B8+9ulCdpc7p4Mu2jPOaGX
 gvR+lxO2rV/wm2zpuU/9ouKaSL8WtYzuB4ZwBU4HqeI/oLyJ3/d6Hg6KwmPNdm4nCBlD
 QzMBmuwgTFn3hqvUpYjdOVKKFeAsTw4HBHQ5eGsJH5poRO4dy99xOBm/sfgiOAkiI+1J
 1N/ysopzYO4XRGI0ysFzNUT9KnGt9O/jMO+lSpE+D51JMLml0sG1I2VfORULk5jayADw
 0X5Q==
X-Gm-Message-State: AOAM5331YgSmJg4hZqMWeyi8XfFXFJgyo5tqxNN4hbOV80zDiPjFFcpm
 8t8QHJFrMh5B2Cnw/MLYx40=
X-Google-Smtp-Source: ABdhPJxYZHAMZK8r1avLZqQyT+NhvO35Mi3DXrBP+wvlmArlvV7owuYyb2TVHHOzbKA3bEkXakVO1A==
X-Received: by 2002:a65:458d:: with SMTP id o13mr10574362pgq.450.1611426342838; 
 Sat, 23 Jan 2021 10:25:42 -0800 (PST)
Received: from [192.168.29.245] ([49.36.171.181])
 by smtp.gmail.com with ESMTPSA id a22sm8777677pjh.5.2021.01.23.10.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:25:42 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
 <20210123151405.26267-1-yashsri421@gmail.com>
 <d5eacb78bd354d26725c34d887a75bf1e8f27a04.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <f23f4003-0017-d52a-39b9-2737e60182bb@gmail.com>
Date: Sat, 23 Jan 2021 23:53:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5eacb78bd354d26725c34d887a75bf1e8f27a04.camel@perches.com>
Content-Language: en-US
Cc: dwaipayanray1@gmail.com, ndesaulniers@google.com,
 clang-built-linux@googlegroups.com, broonie@kernel.org, jpoimboe@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

T24gMjMvMS8yMSAxMDo1MSBwbSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gU2F0LCAyMDIxLTAx
LTIzIGF0IDIwOjQ0ICswNTMwLCBBZGl0eWEgU3JpdmFzdGF2YSB3cm90ZToKPj4gb2JqdG9vbCBy
ZXF1aXJlcyB0aGF0IGFsbCBjb2RlIG11c3QgYmUgY29udGFpbmVkIGluIGFuIEVMRiBzeW1ib2wu
Cj4+IFN5bWJvbCBuYW1lcyB0aGF0IGhhdmUgYSAnLkwnIHByZWZpeCBkbyBub3QgZW1pdCBzeW1i
b2wgdGFibGUgZW50cmllcywgYXMKPj4gdGhleSBoYXZlIHNwZWNpYWwgbWVhbmluZyBmb3IgdGhl
IGFzc2VtYmxlci4KPj4KPj4gJy5MJyBwcmVmaXhlZCBzeW1ib2xzIGNhbiBiZSB1c2VkIHdpdGhp
biBhIGNvZGUgcmVnaW9uLCBidXQgc2hvdWxkIGJlCj4+IGF2b2lkZWQgZm9yIGRlbm90aW5nIGEg
cmFuZ2Ugb2YgY29kZSB2aWEgJ1NZTV8qX1NUQVJUL0VORCcgYW5ub3RhdGlvbnMuCj4+Cj4+IEFk
ZCBhIG5ldyBjaGVjayB0byBlbWl0IGEgd2FybmluZyBvbiBmaW5kaW5nIHRoZSB1c2FnZSBvZiAn
LkwnIHN5bWJvbHMKPj4gZm9yICcuUycgZmlsZXMgaW4gYXJjaC94ODYvZW50cnkvKiBhbmQgYXJj
aC94ODYvbGliLyosIGlmIGl0IGRlbm90ZXMKPj4gcmFuZ2Ugb2YgY29kZSB2aWEgU1lNXypfU1RB
UlQvRU5EIGFubm90YXRpb24gcGFpci4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+Cj4+IExpbms6IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZy9j
bGFuZy1idWlsdC1saW51eC9jLy1kcmttTGd1LWNVL20vNHN0YU9sZi1DZ0FKCj4gCj4gUGxlYXNl
IGRvIG5vdCB1c2UgZ3JvdXBzLmdvb2dsZS5jb20gbGlua3MsIG9yIGlmIHlvdSBtdXN0LCBwbGVh
c2UKPiB1c2UgbGlua3MgdGhhdCBhcmUgcmVhZGFibGUuCj4gCj4gRm9yIGluc3RhbmNlLCB0aGlz
IGlzIGEgYmV0dGVyIGxpbmsgYXMgaXQgc2hvd3MgdGhlIGNvbnRleHQgd2l0aG91dAo+IHN0cnVn
Z2xpbmcgd2l0aCB0aGUgcG9vciBpbnRlcmZhY2U6Cj4gCj4gaHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9nL2NsYW5nLWJ1aWx0LWxpbnV4L2MvRS1uYUJNdF8xU00KPiAKCk9rYXksIEdvdCBpdC4u
IEknbGwgdXNlIGxrbWwgbGluayBmb3IgdGhlIGJlc3QuCgo+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0
eWEgU3JpdmFzdGF2YSA8eWFzaHNyaTQyMUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAqIEFwcGxpZXMg
cGVyZmVjdGx5IG9uIG5leHQtMjAyMTAxMjIKPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBSZWR1
Y2UgdGhlIGNoZWNrIHRvIG9ubHkgU1lNXypfU1RBUlQvRU5EIGxpbmVzCj4+IC0gUmVkdWNlIHRo
ZSBjaGVjayBmb3Igb25seSAuUyBmaWxlcyBpbiBhcmNoL3g4Ni9lbnRyeS8qIGFuZCBhcmNoL3g4
Ni9saWIvKiBhcyBzdWdnZXN0ZWQgYnkgSm9zaCBhbmQgTmljawo+IAo+IEkgdGhpbmsgdGhhdCdz
IHVubmVjZXNzYXJ5Lgo+IAo+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIv
c2NyaXB0cy9jaGVja3BhdGNoLnBsCj4gW10KPj4gQEAgLTM1OTAsNiArMzU5MCwxMyBAQCBzdWIg
cHJvY2VzcyB7Cj4+IMKgCQkJfQo+PiDCoAkJfQo+PiDCoAo+Pgo+PiArIyBjaGVjayBmb3IgLkwg
cHJlZml4IGxvY2FsIHN5bWJvbHMgaW4gLlMgZmlsZXMKPj4gKwkJaWYgKCRyZWFsZmlsZSA9fiBt
QF5hcmNoL3g4Ni8oPzplbnRyeXxsaWIpLy4qXC5TJEAgJiYKPiAKPiBVc2luZyAvLlMkLyBzaG91
bGQgYmUgZW5vdWdoCj4gCj4+ICsJCSAgICAkbGluZSA9fiAvXlwrXHMqU1lNX1tBLVpdK18oPzpT
VEFSVHxFTkQpKD86X1tBLVpfXSspP1xzKlwoXHMqXC5MLykgewo+IAo+IFRoaXMgbWlnaHQgbmVl
ZCB0byBiZQo+IAo+ICsJCSAgICAkbGluZSA9fiAvXlwrXHMqKD86W0EtWl0rXyk/U1lNX1tBLVpd
K18oPzpTVEFSVHxFTkQpKD86X1tBLVpfXSspP1xzKlwoXHMqXC5MLykgewo+IAoKT2theS4uIFRo
YW5rcy4gSSdsbCBtb2RpZnkgdGhlIHBhdGNoIGFjY29yZGluZ2x5LgoKVGhhbmtzCkFkaXR5YQo+
PiArCQkJV0FSTigiQVZPSURfTF9QUkVGSVgiLAo+PiArCQkJICAgICAiQXZvaWQgdXNpbmcgJy5M
JyBwcmVmaXhlZCBsb2NhbCBzeW1ib2wgbmFtZXMgZm9yIGRlbm90aW5nIGEgcmFuZ2Ugb2YgY29k
ZSB2aWEgJ1NZTV8qX1NUQVJUL0VORCcgYW5ub3RhdGlvbnM7IHNlZSBEb2N1bWVudGF0aW9uL2Fz
bS1hbm5vdGF0aW9ucy5yc3RcbiIgLiAkaGVyZWN1cnIpOwo+PiArCQl9Cj4+ICsKPiAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
