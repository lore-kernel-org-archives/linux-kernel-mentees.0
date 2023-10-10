Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653BCCD80B5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 11:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA1960F9C;
	Tue, 10 Oct 2023 11:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA1960F9C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IfyY5dGZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oehHMrYpvyrx; Tue, 10 Oct 2023 11:41:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5F70460B5D;
	Tue, 10 Oct 2023 11:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F70460B5D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3650EC0071;
	Tue, 10 Oct 2023 11:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93174C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB5A410C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FB5A410C7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IfyY5dGZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQz6o_ZZYb36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:41:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04403410C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04403410C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696938059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7b+DAP28sjjsKl/NqKK+vQ1oprFAwolNlLR6iIJGZc4=;
 b=IfyY5dGZQiYpREyiZ9Vc1j0UapH1v4A0RN/m8AFP2mqkJqvP3ikgZsf9u6Kq/QZBIQ5zXA
 /IoCBw52r90Xat308XUWIJcPZmG42215ViW2EzHHWCtHht6ZmbMmIGuZkmOT/fkLwhYbC9
 guq1i+aQtvhrT9yPZ+Y50NH0Fw3IxLA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-rFHyYo9qPzOfuA6LJdVLaw-1; Tue, 10 Oct 2023 07:40:58 -0400
X-MC-Unique: rFHyYo9qPzOfuA6LJdVLaw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5334e22b2dbso2013312a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 04:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696938057; x=1697542857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7b+DAP28sjjsKl/NqKK+vQ1oprFAwolNlLR6iIJGZc4=;
 b=PMDLwSDTfF9ZClW5zNHsl63roEuXCgQXZMTPmgKu0Tvc6yU26an2+P2zBXzr1M7zGo
 PaYRTcdmSQUgQCN1LC71FTNyFKJ3NI6Dr5VO/ShcGrWaAD0s3Y2v+fVlBr6NLbEYylFV
 H0uvL4ggIrImH1edpaSCuJ6MuczS71NXPr74ty1UYc1xgwf+Nnj+nAtbkhHINaZzYLHO
 kDG7YlLZ2dvQ5anIgVx7Agn+mVL/OE4qFdy7cKXQW2T9YkzNMj9dJIGkzoqecvIueqwp
 pcDjSmETLjM/p+kX2gahS+fzWCcdc2ExydJKFemkgLZcDnTWfT2AlWWGj897V9bCOu2l
 doCA==
X-Gm-Message-State: AOJu0YzhG7m7wkeaYTBUJod1cR6rZb+GSlsYe1s/lEkgDUkoIXHDRwuz
 /ifPdylX3luIbFws6qO6XMJ4akE+tq1PG0Of0t2bFUpj5i7+3VioMUG1bgbJukNl8mdt3c6voA/
 /8Gs0r3TjXxSUq4RROnE9OJ8u6AwDwYfixm5Isk/h8MK8jnAN
X-Received: by 2002:a05:6402:1a28:b0:522:3849:48d8 with SMTP id
 be8-20020a0564021a2800b00522384948d8mr16557032edb.9.1696938057296; 
 Tue, 10 Oct 2023 04:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPF6rjIP1ClGozgmSVb/QcNq4AcdaAeAz8RfeTFDOEmM1d6yjpTu+LVxF0w32sc6yh+3zyzQ==
X-Received: by 2002:a05:6402:1a28:b0:522:3849:48d8 with SMTP id
 be8-20020a0564021a2800b00522384948d8mr16557009edb.9.1696938056965; 
 Tue, 10 Oct 2023 04:40:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 w15-20020aa7cb4f000000b0052a063e52b8sm7516724edt.83.2023.10.10.04.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 04:40:56 -0700 (PDT)
Message-ID: <5c19c422-41ad-430b-664c-15f3e2087922@redhat.com>
Date: Tue, 10 Oct 2023 13:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
To: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
 <2023101050-scuff-overstay-9b43@gregkh>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2023101050-scuff-overstay-9b43@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, tglx@linutronix.de,
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

T24gMTAvMTAvMjMgMTM6MzUsIEdyZWcgS0ggd3JvdGU6Cj4gT24gVHVlLCBPY3QgMTAsIDIwMjMg
YXQgMDE6MDQ6MzlQTSArMDMwMCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPj4gVGhlcmUgYXJl
IGJpb3NlcyB0aGF0IGRvZXNuJ3QgYWxsb3cgdG8gY29uZmlndXJlIHRoZQo+PiBudW1iZXIgb2Yg
YXNpZHMgYWxsb2NhdGVkIGZvciBTRVYvU0VWLUVTLCBmb3IgdGhvc2UKPj4gY2FzZXMsIHRoZSBk
ZWZhdWx0IGJlaGF2aW91ciBhbGxvY2F0ZXMgYWxsIHRoZSBhc2lkcwo+PiBmb3IgU0VWLCBsZWF2
aW5nIG5vIHJvb20gZm9yIFNFVi1FUyB0byBoYXZlIHNvbWUgZnVuLgoKSW4gYWRkaXRpb24gdG8g
d2hhdCBHcmVnIHBvaW50ZWQgb3V0IChhbmQgdGhlcmUgYXJlIG1hbnkgbW9yZSBjYXNlcyB0aGF0
IApoYXZlIHRvIGJlIGNoZWNrZWQgZm9yIGVycm9ycywgaW5jbHVkaW5nIHBvc3NpYmxlIG92ZXJm
bG93cyksIHdoeSBpcyBpdCAKY29ycmVjdCB0byBqdXN0IGlnbm9yZSB3aGF0J3MgaW4gQ1BVSUQ/
CgpQYW9sbwoKPiAiZnVuIj8KPiAKPiBBbHNvLCBwbGVhc2UgdXNlIHRoZSBmdWxsIDcyIGNvbHVt
bnMgZm9yIHlvdXIgY2hhbmdlbG9nLgo+IAo+PiBJZiB0aGUgdXNlciByZXF1ZXN0IFNFVi1FUyB0
byBiZSBlbmFibGVkLCBpdCB3aWxsCj4+IGZpbmQgdGhlIGtlcm5lbCBqdXN0IHJ1biBvdXQgb2Yg
cmVzb3VyY2VzIGFuZCBpZ25vcmVkCj4+IHVzZXIgcmVxdWVzdC4gVGhpcyBmb2xsb3dpbmcgcGF0
Y2ggd2lsbCBhZGRyZXNzIHRoaXMKPj4gaXNzdWUgYnkgbWFraW5nIHRoZSBudW1iZXIgb2YgYXNp
ZHMgZm9yIFNFVi9TRVYtRVMKPj4gY29uZmlndXJhYmxlIG92ZXIga2VybmVsIG1vZHVsZSBwYXJh
bWV0ZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2th
cmluZW5AZm94aG91bmQuZmk+Cj4+IC0tLQo+PiAgIGFyY2gveDg2L2t2bS9zdm0vc2V2LmMgfCAy
OCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0vc3ZtL3Nldi5jIGIvYXJjaC94ODYva3ZtL3N2bS9zZXYuYwo+PiBpbmRleCAwNzc1NmI3MzQ4
YWUuLjY4YTYzYjQyZDE2YSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zZXYuYwo+
PiArKysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCj4+IEBAIC01MSw5ICs1MSwxOCBAQAo+PiAg
IHN0YXRpYyBib29sIHNldl9lbmFibGVkID0gdHJ1ZTsKPj4gICBtb2R1bGVfcGFyYW1fbmFtZWQo
c2V2LCBzZXZfZW5hYmxlZCwgYm9vbCwgMDQ0NCk7Cj4+ICAgCj4+ICsvKiBuciBvZiBhc2lkcyBy
ZXF1ZXN0ZWQgZm9yIFNFViAqLwo+PiArc3RhdGljIHVuc2lnbmVkIGludCByZXF1ZXN0ZWRfc2V2
X2FzaWRzOwo+PiArbW9kdWxlX3BhcmFtX25hbWVkKHNldl9hc2lkcywgcmVxdWVzdGVkX3Nldl9h
c2lkcywgdWludCwgMDQ0NCk7Cj4+ICsKPj4gICAvKiBlbmFibGUvZGlzYWJsZSBTRVYtRVMgc3Vw
cG9ydCAqLwo+PiAgIHN0YXRpYyBib29sIHNldl9lc19lbmFibGVkID0gdHJ1ZTsKPj4gICBtb2R1
bGVfcGFyYW1fbmFtZWQoc2V2X2VzLCBzZXZfZXNfZW5hYmxlZCwgYm9vbCwgMDQ0NCk7Cj4+ICsK
Pj4gKy8qIG5yIG9mIGFzaWRzIHJlcXVlc3RlZCBmb3IgU0VWLUVTICovCj4+ICtzdGF0aWMgdW5z
aWduZWQgaW50IHJlcXVlc3RlZF9zZXZfZXNfYXNpZHM7Cj4+ICttb2R1bGVfcGFyYW1fbmFtZWQo
c2V2X2VzX2FzaWRzLCByZXF1ZXN0ZWRfc2V2X2FzaWRzLCB1aW50LCAwNDQ0KTsKPiAKPiBXaHkg
bW9yZSBtb2R1bGUgcGFyYW1ldGVycz8gIFdoeSBjYW4ndCB0aGlzICJqdXN0IHdvcmsiIHByb3Bl
cmx5IHdpdGhvdXQKPiBmb3JjaW5nIGEgdXNlciB0byBtYWtlIG1hbnVhbCBjaGFuZ2VzPyAgVGhp
cyBpc24ndCB0aGUgMTk5MCdzIGFueW1vcmUuCj4gCj4gCj4+ICsKPj4gICAjZWxzZQo+PiAgICNk
ZWZpbmUgc2V2X2VuYWJsZWQgZmFsc2UKPj4gICAjZGVmaW5lIHNldl9lc19lbmFibGVkIGZhbHNl
Cj4+IEBAIC0yMTk0LDYgKzIyMDMsMTEgQEAgdm9pZCBfX2luaXQgc2V2X2hhcmR3YXJlX3NldHVw
KHZvaWQpCj4+ICAgCWlmICghbWF4X3Nldl9hc2lkKQo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCj4+
ICsJaWYgKHJlcXVlc3RlZF9zZXZfYXNpZHMgKyByZXF1ZXN0ZWRfc2V2X2VzX2FzaWRzID4gbWF4
X3Nldl9hc2lkKSB7Cj4+ICsJCXByX2luZm8oIlNFViBhc2lkcyByZXF1ZXN0ZWQgbW9yZSB0aGFu
IGF2YWlsYWJsZTogJXUgQVNJRHNcbiIsIG1heF9zZXZfYXNpZCk7Cj4gCj4gV2h5IGlzbid0IHRo
aXMgYW4gZXJyb3I/Cj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
