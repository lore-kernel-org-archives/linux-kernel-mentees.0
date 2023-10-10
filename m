Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C9CD8CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 18:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C111040AA5;
	Tue, 10 Oct 2023 18:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C111040AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZoVk3P3Tmgo; Tue, 10 Oct 2023 18:11:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6F35540111;
	Tue, 10 Oct 2023 18:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F35540111
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41E1CC0039;
	Tue, 10 Oct 2023 18:11:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFB1EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DF7F402F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DF7F402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZu301tCcPN8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:11:42 +0000 (UTC)
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5076F40111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5076F40111
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.146.32])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8A7E3267AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 18:03:39 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-rfnfq (unknown [10.110.103.92])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 26EE71FE7B;
 Tue, 10 Oct 2023 18:03:39 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net ([176.31.232.109])
 by ghost-submission-6684bf9d7b-rfnfq with ESMTPSA
 id GIhHCPuRJWW7fgAACGw8uA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 10 Oct 2023 18:03:39 +0000
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 21:03:38 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
In-Reply-To: <CAMkAt6o7urak_kAjxEU4wtXv-mGOnyOYdcyhCRMfAG3MAOip0g@mail.gmail.com>
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
 <CAMkAt6o7urak_kAjxEU4wtXv-mGOnyOYdcyhCRMfAG3MAOip0g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <8fd78d002d84f3164eb5a9337e694fa1@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 23.128.248.14
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 10519001355388888742
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpvdefrdduvdekrddvgeekrddugedpudejiedrfedurddvfedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, pbonzini@redhat.com, tglx@linutronix.de,
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

T24gMjAyMy0xMC0xMCAxOTo0OSwgUGV0ZXIgR29uZGEgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMTAs
IDIwMjMgYXQgNToyMuKAr0FNIEpvc8OpIFBla2thcmluZW4KPiA8am9zZS5wZWtrYXJpbmVuQGZv
eGhvdW5kLmZpPiB3cm90ZToKPj4gCj4+IFRoZXJlIGFyZSBiaW9zZXMgdGhhdCBkb2Vzbid0IGFs
bG93IHRvIGNvbmZpZ3VyZSB0aGUKPj4gbnVtYmVyIG9mIGFzaWRzIGFsbG9jYXRlZCBmb3IgU0VW
L1NFVi1FUywgZm9yIHRob3NlCj4+IGNhc2VzLCB0aGUgZGVmYXVsdCBiZWhhdmlvdXIgYWxsb2Nh
dGVzIGFsbCB0aGUgYXNpZHMKPj4gZm9yIFNFViwgbGVhdmluZyBubyByb29tIGZvciBTRVYtRVMg
dG8gaGF2ZSBzb21lIGZ1bi4KPj4gSWYgdGhlIHVzZXIgcmVxdWVzdCBTRVYtRVMgdG8gYmUgZW5h
YmxlZCwgaXQgd2lsbAo+PiBmaW5kIHRoZSBrZXJuZWwganVzdCBydW4gb3V0IG9mIHJlc291cmNl
cyBhbmQgaWdub3JlZAo+PiB1c2VyIHJlcXVlc3QuIFRoaXMgZm9sbG93aW5nIHBhdGNoIHdpbGwg
YWRkcmVzcyB0aGlzCj4+IGlzc3VlIGJ5IG1ha2luZyB0aGUgbnVtYmVyIG9mIGFzaWRzIGZvciBT
RVYvU0VWLUVTCj4+IGNvbmZpZ3VyYWJsZSBvdmVyIGtlcm5lbCBtb2R1bGUgcGFyYW1ldGVycy4K
Pj4gCj4gCj4gQWxsIHRoaXMgcGF0Y2ggZG9lcyBpcyBpbnRyb2R1Y2UgYW4gZXJyb3IgY2FzZSBy
aWdodD8gQmVjYXVzZSBpZiB0aGUKPiBCSU9TIGhhc24ndCBhY3R1YWxseSBjb25maWd1cmVkIHRo
b3NlIFNFVi1FUyBhc2lkcyBhbmQgS1ZNIHRyaWVzIHRvCj4gdXNlIGFuIFNFViBhcyBhbiBTRVYt
RVMgYXNpZCBjb21tYW5kcyB0byB0aGUgQVNQIHdpbGwgZmFpbCwgcmlnaHQ/Cj4gCj4gV2hhdCBo
YXBwZW5zIHdoZW4geW91IHRyeSB0byBjcmVhdGUgYW4gU0VWLUVTIFZNIHdpdGggdGhpcyBwYXRj
aCwgd2hlbgo+IHRoZSBCSU9TIGhhc24ndCBhbGxvY2F0ZWQgYW55IFNFVi1FUyBhc2lkcz8KCiAg
ICAgSXQgc3RpbGwgZG9lc24ndCBlbmFibGUgU0VWLUVTIHNpbmNlIHRoZSBjcHUgZXhwb3Nlcwpt
aW5fc2V2X2FzaWRzIGFzIDEsIGFuZCB0aGVyZSBpcyBhIGNoZWNrIHRvIGJhaWwgb3V0IGluCnRo
ZSBoYXJkd2FyZSBzZXR1cCBmdW5jdGlvbiwgc28gZGVmaW5pdGVseSB0aGlzIGlzIG5vdApmaXhp
bmcgYW55dGhpbmcuIEkgbWF5IG5vdCBiZWluZyB1bmRlcnN0YW5kaW5nIHNvbWV0aGluZwpoZXJl
IHRob3VnaCwgc2luY2UgbXkgQklPUyBkb2Vzbid0IHNlZW0gdG8gaGF2ZSBhbnkgb3B0aW9ucwpu
b3IgaGludHMgYWJvdXQgU0VWLUVTLCBzbyBJJ20gbm90IHF1aXRlIHN1cmUgaXQgcmVhbGx5CmRv
ZXMgc29tZXRoaW5nIHRvIHByb3ZpZGUgdGhlIGZ1bmN0aW9uYWxpdHkuIEZvciB0aGUgcmVjb3Jk
cwppdCBpcyBhIFN1cGVybWljcm8gSDExU1NMLU5DLgoKICAgICBUaGFua3MhCgogICAgIEpvc8Op
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
