Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5543ACD8CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 15:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB0341C53;
	Tue, 10 Oct 2023 15:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB0341C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gzynC8nPfxx; Tue, 10 Oct 2023 15:09:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C443E408C9;
	Tue, 10 Oct 2023 15:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C443E408C9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4CB6C0039;
	Tue, 10 Oct 2023 15:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07F5EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7A6940B08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7A6940B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2emdTZYqJP5w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:09:13 +0000 (UTC)
X-Greylist: delayed 4187 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Oct 2023 15:09:13 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BCF840432
Received: from 3.mo584.mail-out.ovh.net (3.mo584.mail-out.ovh.net
 [46.105.57.129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BCF840432
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:09:13 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.143.183])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id BB60B258FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:20:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nrnbc (unknown [10.110.103.46])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BE0761FEC1;
 Tue, 10 Oct 2023 12:20:02 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net ([151.80.29.18])
 by ghost-submission-6684bf9d7b-nrnbc with ESMTPSA
 id OdwFLHJBJWXSDQAAjjGCXQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 10 Oct 2023 12:20:02 +0000
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 15:20:02 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
In-Reply-To: <5c19c422-41ad-430b-664c-15f3e2087922@redhat.com>
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
 <2023101050-scuff-overstay-9b43@gregkh>
 <5c19c422-41ad-430b-664c-15f3e2087922@redhat.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0c73f3ee77afe22879fbbed8a34f838f@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.173
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 4716113239035455142
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupdduledvrdegvddrudduiedrudejfedpudehuddrkedtrddvledrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, tglx@linutronix.de, seanjc@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMjAyMy0xMC0xMCAxNDo0MCwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxMC8xMC8yMyAx
MzozNSwgR3JlZyBLSCB3cm90ZToKPj4gT24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMDE6MDQ6MzlQ
TSArMDMwMCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPj4+IFRoZXJlIGFyZSBiaW9zZXMgdGhh
dCBkb2Vzbid0IGFsbG93IHRvIGNvbmZpZ3VyZSB0aGUKPj4+IG51bWJlciBvZiBhc2lkcyBhbGxv
Y2F0ZWQgZm9yIFNFVi9TRVYtRVMsIGZvciB0aG9zZQo+Pj4gY2FzZXMsIHRoZSBkZWZhdWx0IGJl
aGF2aW91ciBhbGxvY2F0ZXMgYWxsIHRoZSBhc2lkcwo+Pj4gZm9yIFNFViwgbGVhdmluZyBubyBy
b29tIGZvciBTRVYtRVMgdG8gaGF2ZSBzb21lIGZ1bi4KPiAKPiBJbiBhZGRpdGlvbiB0byB3aGF0
IEdyZWcgcG9pbnRlZCBvdXQgKGFuZCB0aGVyZSBhcmUgbWFueSBtb3JlIGNhc2VzCj4gdGhhdCBo
YXZlIHRvIGJlIGNoZWNrZWQgZm9yIGVycm9ycywgaW5jbHVkaW5nIHBvc3NpYmxlIG92ZXJmbG93
cyksIHdoeQo+IGlzIGl0IGNvcnJlY3QgdG8ganVzdCBpZ25vcmUgd2hhdCdzIGluIENQVUlEPwoK
ICAgICBJJ2xsIGNoZWNrIGlmIEkgY2FuIHVzZSBjcHVpZCBpbmZvIHRvIGltcHJvdmUgdGhpcwpm
b3IgdjIsIEkganVzdCBub3RpY2VkIG15IGNwdSBhZHZlcnRpc2VzIHNldl9lcyBidXQKdGhlIGtl
cm5lbCBkb2Vzbid0IGFjdGl2YXRlIGl0IGRlc3BpdGUgb2YgdGhlIGt2bV9hbWQKcGFyYW1ldGVy
IGJlaW5nIHNldCwgc28gSSB0cmllZCB0byBmaXggaXQgdGhpcyB3YXksIGJ1dAphbnkgY29tbWVu
dHMgb3IgaWRlYXMgZm9yIGltcHJvdmVtZW50IGFyZSB3ZWxjb21lZC4KCiAgICAgVGhhbmtzIQoK
ICAgICBKb3PDqS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
