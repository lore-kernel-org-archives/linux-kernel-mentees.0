Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD6AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:35:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6598422482
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6598422482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB917867E0;
	Tue,  5 Jan 2021 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zavqUfGVyqQk; Tue,  5 Jan 2021 10:35:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D15C86055;
	Tue,  5 Jan 2021 10:35:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 820F3C088B;
	Tue,  5 Jan 2021 10:35:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8E32C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4A06867E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FrWxA-sHxgT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:35:36 +0000 (UTC)
X-Greylist: delayed 00:15:24 by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3442986055
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:35:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-78-7QYeCnYBNmqiCO7SySjlkg-1; Tue, 05 Jan 2021 10:35:32 +0000
X-MC-Unique: 7QYeCnYBNmqiCO7SySjlkg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 5 Jan 2021 10:35:31 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 5 Jan 2021 10:35:31 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Joe Perches' <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>
Thread-Topic: [PATCH] checkpatch: fix unescaped left braces
Thread-Index: AQHW40n3I32sBUugtEWF3xXGRvsfoqoY1Xyw
Date: Tue, 5 Jan 2021 10:35:31 +0000
Message-ID: <027501cb2506426d9c05adf56d002781@AcuMS.aculab.com>
References: <20210105093507.29297-1-dwaipayanray1@gmail.com>
 <cf102ac77eb1f9e6424f30aef835f6c61dd03407.camel@perches.com>
In-Reply-To: <cf102ac77eb1f9e6424f30aef835f6c61dd03407.camel@perches.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix unescaped left
	braces
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

RnJvbTogSm9lIFBlcmNoZXMKPiBTZW50OiAwNSBKYW51YXJ5IDIwMjEgMTA6MDEKPiAKPiBPbiBU
dWUsIDIwMjEtMDEtMDUgYXQgMTU6MDUgKzA1MzAsIER3YWlwYXlhbiBSYXkgd3JvdGU6Cj4gPiBQ
ZXJsIDUuMjIgb253YXJkcyByZXF1aXJlIHRoYXQgIkEgbGl0ZXJhbCAieyIgc2hvdWxkIG5vdyBi
ZQo+ID4gZXNjYXBlZCBpbiBhIHBhdHRlcm4iLgoKU291bmRzIGxpa2UgYSBnb29kIHJlYXNvbiB0
byBuZXZlciB1c2UgcGVybCA6LSkKCj4gTm90IHF1aXRlIGNvcnJlY3QuCj4gCj4gPiBjaGVja3Bh
dGNoIGNvbnRhaW5zIHNldmVyYWwgbGl0ZXJhbCAieyIuIEZpeCBzdWNoIGluc3RhbmNlcwo+ID4g
YnkgcHJlY2VkaW5nIHRoZW0gd2l0aCBhIGJhY2tzbGFzaC4KPiAKPiBOb3QgYWxsIGxpdGVyYWwg
bGVmdCBicmFjZXMgbmVlZCB0byBiZSBlc2NhcGVkLgo+IGh0dHBzOi8vd3d3LnBlcmxtb25rcy5v
cmcvP25vZGVfaWQ9MTE5MTk4MQo+IAo+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbAo+IFtdCj4gPiBAQCAtMjAzNiw3ICsyMDM2LDcg
QEAgc3ViIGFubm90YXRlX3ZhbHVlcyB7Cj4gPiDCoAkJCXByaW50ICJBU1NJR04oJDEpXG4iIGlm
ICgkZGJnX3ZhbHVlcyA+IDEpOwo+ID4gwqAJCQkkdHlwZSA9ICdOJzsKPiA+Cj4gPgo+ID4gLQkJ
fSBlbHNpZiAoJGN1ciA9fi9eKDt8e3x9KS8pIHsKPiA+ICsJCX0gZWxzaWYgKCRjdXIgPX4gL14o
O3xce3xcfSkvKSB7Cgppc24ndCAoO3x7fH0pIG11Y2ggdGhlIHNhbWUgYXMgWzt7fV0gPz8KCglE
YXZpZAoKLQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQg
RmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0Bs
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
