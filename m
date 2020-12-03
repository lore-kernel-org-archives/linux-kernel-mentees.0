Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DF1C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:07:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B12B521D95
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B12B521D95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C088876AB;
	Thu,  3 Dec 2020 19:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFs8QXdyznua; Thu,  3 Dec 2020 19:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2F98876AA;
	Thu,  3 Dec 2020 19:07:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AED23C163C;
	Thu,  3 Dec 2020 19:07:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE9CDC0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EA54087B41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZorUWkk7kIN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:07:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6950E87B40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=g4HBptT8fiySRcTajzMRTlRGWzESksOlO+bH6MZblpU=; b=el3HGxdOM2TJ3q2T9+HMzJ1Mth
 aNLWKxtrYru1CYYE68mqGY6ybygj8aOLI6nzlUM4MCRLpiXYTeNgL2NgabjLV6fSih5GtVhw+8sOQ
 2VUmKvcNBRQ/RKeZYxHn+Mt+Uqi48NYJrN71SXOllqepIc0Fi1WIYzLV66/i49JNhwMrj9BbjTt5J
 QrizonVWVlIuJdlxWFG/MRLnHp8YmoKZT9hJnntDUMQkasyr9OpSBP5GAlNotn90+0j9qhqLnxFsX
 QZjHJ0nbxSVviWOHE1CPw93zJ0HDaYKHlBfe2QdX3xz/QMSNnb42RUc5b/0vTpzMdKXI/LNl2nOy6
 CbUBB+FA==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kktwb-0007dT-OQ; Thu, 03 Dec 2020 19:07:10 +0000
To: Joe Perches <joe@perches.com>, Nicolai Fischer <nicolai.fischer@fau.de>,
 linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
References: <133ac827-c0d2-c5c7-39d8-7d2c17de7c76@fau.de>
 <8436bc4191d92af283ea6aa7ca450e36da653e2e.camel@perches.com>
 <16f0bfd4-61ca-48d8-c9ab-10bfc9a233ad@infradead.org>
 <a83033e9fcc706be129e9c4c0d30a0542f13d406.camel@perches.com>
 <7a81a3c0-2734-4799-5b34-0a6279c1e59d@infradead.org>
 <40543766190a1d5e054e6573ae00112467acf964.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <35b5a3fd-7b15-1173-b64a-b20839706527@infradead.org>
Date: Thu, 3 Dec 2020 11:07:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <40543766190a1d5e054e6573ae00112467acf964.camel@perches.com>
Content-Language: en-US
Cc: apw@canonical.com, johannes.czekay@fau.de,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@i4.cs.fau.de
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: correctly detect
	lines of help text
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

T24gMTIvMy8yMCAxMTowNCBBTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gVGh1LCAyMDIwLTEy
LTAzIGF0IDEwOjMxIC0wODAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEyLzMvMjAgOTo1
OCBBTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+PiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTA6NTkg
LTA4MDAsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4+Cj4+Pj4gVGhlcmUgYXJlIGFsc28gbGFyZ2Ug
aHVua3Mgb2YgYmxvY2svS2NvbmZpZyBhbmQgZHJpdmVycy9oaWQvS2NvbmZpZwo+Pj4+IHRoYXQg
ZG9uJ3QgdXNlIGFueSBpbmRlbnRhdGlvbiBmb3IgaGVscCB0ZXh0Li4uCj4+Pj4gaW4gY2FzZSB0
aGF0IG1hdHRlcnMgaGVyZS4KPj4+Cj4+PiBNYXliZSBzb21ldGhpbmcgbGlrZSB0aGlzIGNvdWxk
IGhlbHAuCj4+Pgo+Pj4gSW5kZW50IHRoZSB1bmluZGVudGVkIGhlbHAgYmxvY2tzIGJ5IDIgc3Bh
Y2VzIGFuZCByZWZsb3cgd2hlcmUgYXBwcm9wcmlhdGUuCj4+Pgo+Pj4gLS0tCj4+PiDCoGJsb2Nr
L0tjb25maWcgICAgICAgfCAxMDUgKysrKystLS0tLQo+Pj4gwqBkcml2ZXJzL2hpZC9LY29uZmln
IHwgNTQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMzUgaW5zZXJ0aW9ucygrKSwgMzE5IGRlbGV0aW9u
cygtKQo+Pgo+Pgo+PiBMR1RNLiBUaGFua3MuCj4gCj4gYnR3OiB0aGVyZSBhcHBlYXJzIHRvIGJl
IH43NTAgaGVscCBzZWN0aW9ucyBpbiBLY29uZmlnIGZpbGVzCj4gdGhhdCBkbyBub3QgdXNlIDIg
c3BhY2UgaW5kZW50YXRpb24gZm9yIHRoZSBoZWxwIGNvbnRlbnQgdnMKPiB0aGUgfjE0MDAwIGhl
bHAgc2VjdGlvbnMgdGhhdCBkbyB1c2UgMiBzcGFjZSBpbmRlbnRhdGlvbi4KPiAKPiBNYXliZSB0
aGVyZSdzIHNvbWUgdmFsdWUgaW4gc3RhbmRhcmRpemluZyBvbiB0aGUgMiBzcGFjZSBzdHlsZS4K
CmNvZGluZy1zdHlsZS5yc3QgaW1wbGllcyB0byBtZWFuIHRoYXQgd2UgaGF2ZSBhbHJlYWR5IGRv
bmUgdGhhdDoKCkZvciBhbGwgb2YgdGhlIEtjb25maWcqIGNvbmZpZ3VyYXRpb24gZmlsZXMgdGhy
b3VnaG91dCB0aGUgc291cmNlIHRyZWUsCnRoZSBpbmRlbnRhdGlvbiBpcyBzb21ld2hhdCBkaWZm
ZXJlbnQuICBMaW5lcyB1bmRlciBhIGBgY29uZmlnYGAgZGVmaW5pdGlvbgphcmUgaW5kZW50ZWQg
d2l0aCBvbmUgdGFiLCB3aGlsZSBoZWxwIHRleHQgaXMgaW5kZW50ZWQgYW4gYWRkaXRpb25hbCB0
d28Kc3BhY2VzLgoKCj4gCj4gQSB0cml2aWFsIHNjcmlwdCB0byBzaG93IHRoZSBzZWN0aW9ucyB0
aGF0IGRvbid0IHVzZSAyIHNwYWNlczoKPiAKPiAkIGdpdCBncmVwIC1uIC1BMSAtUCAiXlxzKmhl
bHBccyokIiAtLSAnKi9LY29uZmlnKicgfAo+ICAgZ3JlcCAtdiAnXi0tJCcgfAo+ICAgcGVybCAt
ZSAnd2hpbGUgKDw+KSB7Cj4gICAgIG15ICRsaW5lMSA9ICRfOwo+ICAgICBteSAkbGluZTIgPSA8
PjsKPiAKPiAgICAgbXkgJGwxID0gJGxpbmUxOwo+ICAgICBteSAkbDIgPSAkbGluZTI7Cj4gCj4g
ICAgIGNob21wKCRsMSk7Cj4gICAgIGNob21wKCRsMik7Cj4gCj4gICAgICRsMSA9fiBzL14uKjpc
ZCs6KFxzKikuKi8kMS87Cj4gICAgICRsMiA9fiBzL14uKi1cZCstKFxzKikuKi8kMS87Cj4gCj4g
ICAgIGlmICgiJGwxICAiIG5lICIkbDIiKSB7Cj4gCXByaW50ICIkbGluZTEiOwo+IAlwcmludCAi
JGxpbmUyIjsKPiAgICAgfQo+IH0nCj4gCj4gQ2hhbmdlIHRoZSBuZSB0byBlcSB0byBzZWUgdGhl
IG1hdGNoZXMuCj4gCj4gRm9yIGluc3RhbmNlLCBhIGhlYWQgLTUwIG9mIHRoZSBhYm92ZSBpczoK
PiAKW3NuaXBdCgp0aGFua3MuCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApM
aW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50
ZWVzCg==
