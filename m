Return-Path: <SRS0=KfMm=IK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D022C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Mar 2021 17:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB64E64E90
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Mar 2021 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB64E64E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B52F84ED77;
	Fri, 12 Mar 2021 17:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PH_URswsQhPg; Fri, 12 Mar 2021 17:45:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 177CC4ED1C;
	Fri, 12 Mar 2021 17:45:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2F40C000B;
	Fri, 12 Mar 2021 17:45:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF1A2C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 17:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2F8060661
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 17:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3-3QaC9xp8G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 17:45:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7B1C605DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 17:45:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k9so47034245lfo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 09:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nx/msPK81ViEs6xwToz0euu7YyJQKrnTsMQlMdp1bqc=;
 b=M/jQvmmBYq/3ATIxhmZNXv+4aDrEuxVUtdnAiY5vV1x2mjd+99ZOTG1WrXCQ0DReIy
 CcR5LL21o9Io6G5dbzVTqy/SoCsTlImgX4r/fWv/+DvQhlgGaOPi0M6cKynOy8mr+kGS
 HvurKihS3oE7dGQnjH6RzYRRHtoDcdij+zgMXfwEYVkqlDUOkRqkA9wARPwG6h5vEvpf
 m/Y21wpAYNsxY7m5GLwzXKNxUQY/rco87658S0ccJ1Bzf/L4wwr+vyCN3K0lmF8fDZUR
 T3nGcz3Nqf+sxQ2bU43nPSeiyZmN6kf+5uGdNw+rZHIY2WUbLJcfhNAQPj3BHHpKiUey
 RV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nx/msPK81ViEs6xwToz0euu7YyJQKrnTsMQlMdp1bqc=;
 b=Z6YNxtpJngEY/zPcDnhOcyVv9YXef9zfvp7hBgEQTwVOJMqLjjpQrlRcWk4V60y9vV
 HsSmgrUFssp5VPxM72MSDZBPn1e52sxQa3Dm5l8Z8X/HaSAUI/tBFihNiViG4ZoiHxOQ
 nz2ieDUQle3cS7zmR+uhTglGUhS0lw6aNg/hB9J2W9iPejNUryuuvt9BQNXIfOUi7pl8
 yuToshcGUgj6N3ncvL1VaezEG8+Pnz+Xkhw9q89BJHHvdOjXpr6a19ktfK7ZOui2INbq
 Tv1KsaG/At2ad3LV8sHPj/AlDRR0L1zw8U0jz9s0F+eQ+wgYlO7u/Aaz1n+AMRYj8lkq
 Rlyg==
X-Gm-Message-State: AOAM533jmXFQU2EVMvDjPyIInk3cHtg0cY0kvd1FgjSwMnQm2y0NRUUr
 XeONsJxTd5uYYt1o/1Us5Cz9/HOh35HMOXFDFPs=
X-Google-Smtp-Source: ABdhPJyq5jWYnj2s5PVcL8rDnAhvcBNNXaeNdG5VBfOqAhSTKEyzkLy1QNBDZliIqZ7aEXK4yGPd7XxDu5Az+Zn4Nuk=
X-Received: by 2002:a05:6512:1094:: with SMTP id
 j20mr221576lfg.442.1615571100778; 
 Fri, 12 Mar 2021 09:45:00 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 12 Mar 2021 23:14:49 +0530
Message-ID: <CABJPP5Amu7dr=i1moc4eK2+WEhQky5V5HsweiOPzxaxGTitZdg@mail.gmail.com>
Subject: Mentorship report first draft
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/mixed; boundary="0000000000009256d005bd5a7511"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--0000000000009256d005bd5a7511
Content-Type: text/plain; charset="UTF-8"

Hello,
As discussed earlier, attached is the initial draft of the mentorship report.

Please let me know in case you have any suggestions.
Also you can view it live at
https://raydwaipayan.github.io/blogs/posts/linux-kernel-mentorship/

Thank you!
Dwaipayan.

--0000000000009256d005bd5a7511
Content-Type: text/markdown; charset="US-ASCII"; name="linux-kernel-mentorship.md"
Content-Disposition: attachment; filename="linux-kernel-mentorship.md"
Content-Transfer-Encoding: base64
Content-ID: <f_km6laaiz0>
X-Attachment-Id: f_km6laaiz0

LS0tCnRpdGxlOiAiTGludXggS2VybmVsIGNoZWNrcGF0Y2gucGwgbWVudG9yc2hpcCIKZGF0ZTog
MjAyMS0wMy0wNlQwMjowNToxNyswNTozMApkcmFmdDogZmFsc2UKLS0tCgojIyBDaGVja3BhdGNo
IC0gV2hhdCBpcyBpdD8KW2NoZWNrcGF0Y2gucGxdKGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9zY3JpcHRzL2NoZWNrcGF0Y2gucGwpIGlzIGEgdHJpdmlhbCBz
dHlsZSBjaGVja2VyIGZvciBwYXRjaGVzIHNlbnQgdG8gdGhlIGxpbnV4IGtlcm5lbC4KCldoeSBp
cyBpdCBuZWVkZWQgeW91IHNheT88L2JyPgpJIGRpZCBhbiBhbmFseXNpcyBvbiBjaGVja3BhdGNo
IHdhcm5pbmdzIG9uIGFib3V0IDUwayBjb21taXRzIGZyb20gdjUuNC48L2JyPgooRmluZCB0aGUg
ZnVsbCByZXBvcnQge3slIGxpbmsgY2hlY2twYXRjaF9vdXRfNTBrLnR4dCAlfX1oZXJle3slIC9s
aW5rICV9fSkKClRoZSB0b3AgZXJyb3JzIHdlcmUgdGhlbiBnZW5lcmF0ZWQgdmlhIHRoZSBmb2xs
b3dpbmcgc2hlbGwgY29tbWFuZDoKYGBgL2Jpbi9iYXNoCmNhdCBjaGVja3BhdGNoX291dF81MGsu
dHh0IHwgZ3JlcCAtb1AgIig/OldBUk5JTkd8RVJST1J8Q0hFQ0spOihcdyspIiBcCnwgc29ydCB8
IHVuaXEgLWMgfCBzb3J0IC1uciAgfCBoZWFkIC1uNgpgYGAKCkNvdW50IG9mIGVycm9ycyB8IEVy
cm9yIFR5cGVzIHwgRXJyb3IKLS0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0tfC0tLS0tLQo0
MTk5OSB8IDxzcGFuIHN0eWxlPSJjb2xvcjpncmVlbiI+Q0hFQ0s8L3NwYW4+IHwgQ0FNRUxDQVNF
CjEzNjI5IHwgPHNwYW4gc3R5bGU9ImNvbG9yOmdyZWVuIj5DSEVDSzwvc3Bhbj4gfCBQQVJFTlRI
RVNJU19BTElHTk1FTlQKMTE0OTEgfCA8c3BhbiBzdHlsZT0iY29sb3I6b3JhbmdlIj5XQVJOSU5H
PC9zcGFuPiB8IExPTkdfTElORQo4MTA2IHwgPHNwYW4gc3R5bGU9ImNvbG9yOmdyZWVuIj5DSEVD
Szwvc3Bhbj4gfCBTUEFDSU5HCjY4MjUgfCA8c3BhbiBzdHlsZT0iY29sb3I6b3JhbmdlIj5XQVJO
SU5HPC9zcGFuPiB8IExFQURJTkdfU1BBQ0UKNDM5NCB8IDxzcGFuIHN0eWxlPSJjb2xvcjpncmVl
biI+Q0hFQ0s8L3NwYW4+IHwgT1BFTl9FTkRFRF9MSU5FCgpIbW0uLi5UaGUgbm8uIG9mIHN0eWxp
c3RpY2FsbHkgaW5jb3JyZWN0IGJpdHMgc3RpbGwgY29udGludWUgdG8gZXhpc3QgYW5kCmFyZSBz
dGlsbCBtZXJnZWQgaW50byB0aGUga2VybmVsIGNvZGUuIFRvIG1ha2UgdGhlIGtlcm5lbCBjb2Rl
IG1vcmUKc3R5bGlzdGljYWxseSBjb2hlcmVudCwgd2UgY2FuOgoKPiAtIENyZWF0ZSBjbGVhbnVw
IHBhdGNoZXMgZm9yIHRoZSBleGlzdGluZyBjb2RlCj4gLSBNYWtlIHN1cmUgbmV3IHBhdGNoZXMg
YXJlIHN0eWxpc3RpY2FsbHkgY29uc2lzdGVudAoKQm90aCBvZiB0aGVzZSBhcmUgd2hlcmUgY2hl
Y2twYXRjaCBjb21lcyBoYW5keS4KCiMjIENoZWNrcGF0Y2ggaW4gdGhlIHBhdGNoIHN1Ym1pc3Np
b24gcHJvY2VzcwoKQmVmb3JlIHNlbmRpbmcgb3V0IHRoZSBwYXRjaGVzIHRvIHRoZSBtYWlsaW5n
IGxpc3QsIGl0IGlzIHJlY29tbWVuZGVkIHRvCnJ1biBjaGVja3BhdGNoIG92ZXIgdGhlIHBhdGNo
ZXMuCgpJbiBnZW5lcmFsLCBhIEtlcm5lbCBkZXZlbG9wZXIgd291bGQ6Cgo+IC0gQ3JlYXRlIHRo
ZSBwYXRjaCB3aXRoIGhpcyBwcm9wb3NlZCBjaGFuZ2VzLgo+IC0gQnVpbGQgY2hlY2sgdGhlIHBh
dGNoLCBydW4gYWRkaXRpb25hbCB0b29scyBsaWtlIGNoZWNrc3RhY2ssIHNwYXJzZSBldGMuCj4g
LSBSdW4gY2hlY2twYXRjaC5wbCBvdmVyIHRoZSBwYXRjaGVzIHRvIGVsaW1pbmF0ZSBhbGwgdHJp
dmlhbCBzdHlsZSB2aW9sYXRpb25zLgo+IC0gU2VuZCBvdXQgdGhlIHBhdGNoIHRvIHRoZSBtYWlu
dGFpbmVycyBhbmQgbWFpbGluZyBsaXN0LgoKClRoZSBvbmx5IGNhdGNoIGhlcmUgaXMgdGhhdCBj
aGVja3BhdGNoIGlzIG5vdCBhbHdheXMgcmlnaHQuIEl0IGlzIGp1c3QgYSBkdW1iCnBlcmwgc2Ny
aXB0LiBJZiB0aGUgY29kZSBsb29rcyBiZXR0ZXIgd2l0aCBjaGVja3BhdGNoIGVycm9ycywgbGV0
IGl0IGJlLgoKIyMgRHJhd2JhY2tzIG9mIGNoZWNrcGF0Y2gKCkNoZWNrcGF0Y2ggaXMgb25seSBh
IHN0YXRpYyB0cml2aWFsIHN0eWxlIGNoZWNrZXIuIEl0IGRvZXMgbm90IGhhdmUgdGhlCmNhcGFi
aWxpdGllcyBvZiBhIGZ1bGwgYyBiYXNlZCBwYXJzZXIgbGlrZSBbY2xhbmctZm9ybWF0XShodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL2NsYW5nLWZvcm1hdC5o
dG1sKS4gSW4gdGhpcyBzZW5zZSBpdCBpcyBsaW1pdGVkIGluCndoYXQgaXQgY2FuIGRvLiBTdGls
bCwgaXQgaXMgaGlnaGx5IHZhbHVhYmxlIGFzIGEgc3R5bGUgY2hlY2tlciB0b29sIGFuZCBjYW4K
ZWFzZSB0aGUgd29yayBvZiBtYWludGFpbmVycyBhbmQgaW5jcmVhc2UgdGhlIGNoYW5jZXMgb2Yg
dGhlIHBhdGNoIGJlaW5nIGFjY2VwdGVkCmJ5IHRoZSBjb21tdW5pdHkuCgojIyBXaGF0IGRpZCB3
ZSBkbyB0byBpbXByb3ZlIGl0PwoKT3ZlciB0aGUgZmlyc3QgMyBtb250aHMgb2YgbXkgbWVudG9y
c2hpcCBwZXJpb2QsIEkgcHJpbWFyaWx5IGZvY3VzZWQgb24KZWxpbWluYXRpbmcgZmFsc2UtcG9z
aXRpdmVzIGZyb20gY2hlY2twYXRjaCBhcyB3ZWxsIGFzIGFkZGluZyBuZXcgcnVsZXMuCgpDb25z
aWRlciB0aGUgZm9sbG93aW5nIHBhdGNoIGNvbW1pdCBsb2c6CgpgYGBkaWZmCiNpbmNsdWRlIGFz
bS9iaXRzcGVybG9uZy5oIGF2b2lkIGZ1cnRoZXIgcG90ZW50aWFsIHVzZXJzcGFjZSBwb2xsdXRp
b24KYnkgbW92aW5nIHRoZSAjZGVmaW5lIG9mIFNISUZUX1BFUl9MT05HIHRvIGJpdG9wcy5oIHdo
aWNoIGlzIG5vdApleHBvcnRlZCB0byB1c2Vyc3BhY2UuCmBgYAoKQSBrZXJuZWwgZGV2ZWxvcGVy
IGluIDIwMjAgd291bGQgbm90IHNlZSBhbnkgY2hlY2twYXRjaCB3YXJuaW5nLgoKQSBrZXJuZWwg
ZGV2ZWxvcGVyIGluIDIwMjEgd291bGQgc2VlIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKYGBgXGJp
blxiYXNoCldBUk5JTkc6IENvbW1pdCBsb2cgbGluZXMgc3RhcnRpbmcgd2l0aCAnIycgYXJlIGRy
b3BwZWQgYnkgZ2l0IGFzIGNvbW1lbnRzCiM4MjogCiNpbmNsdWRlIGFzbS9iaXRzcGVybG9uZy5o
IGF2b2lkIGZ1cnRoZXIgcG90ZW50aWFsIHVzZXJzcGFjZSBwb2xsdXRpb24KYGBgCgpEdXJpbmcg
dGhlIGxhc3QgMyBtb250aHMgSSB3b3JrZWQgb24gdHdvIG1ham9yIGZlYXR1cmVzOgoKPiAtIEFk
ZGl0aW9uIG9mIGEgdmVyYm9zZSBtb2RlIHRvIGNoZWNrcGF0Y2gKPiAtIEFkZGl0aW9uIG9mIGFu
IGV4dGVybmFsIGRvY3VtZW50YXRpb24gdG8gY2hlY2twYXRjaAoKRm9yIHRoZSBkb2N1bWVudGF0
aW9uIHdlIGRlY2lkZWQgdG8gZG9jdW1lbnQgYWxsIGNoZWNrcGF0Y2ggbWVzc2FnZSB0eXBlcywK
dGhlaXIgbWVhbmluZ3MgYW5kIGhvdyB0byByZXNvbHZlIHRoZW0uIFRoaXMgaXMgc3RpbGwgYSB3
b3JrIGluIHByb2dyZXNzLgpDb250cmlidXRpb25zIGFyZSBkZWZpbml0ZWx5IHdlbGNvbWUgOi1Q
LgoKIyMjIFZlcmJvc2UgTW9kZQoKVGhpcyB3YXMgb25lIG9mIHRoZSBuZXcgYWRkaXRpb25zIHdl
IGRpZCB0byBjaGVja3BhdGNoLgoKT25lIGNhbiBydW4gY2hlY2twYXRjaCBsaWtlIHRoaXM6Cgpg
YGAvYmluL2Jhc2gKLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLXYgdGVzdC5wYXRjaApgYGAKCkFs
bCB2ZXJib3NlIGRlc2NyaXB0aW9ucyBjYW4gYmUgc2VlbiBieSBwYWlyaW5nIHRoZSB2ZXJib3Nl
IG9wdGlvbgp3aXRoIC0tbGlzdC10eXBlczoKCmBgYC9iaW4vYmFzaAouL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbCAtLWxpc3QtdHlwZXMgLXYKYGBgCgojIyMgQ2hlY2twYXRjaCBEb2N1bWVudGF0aW9u
CgpUaGUgY2hlY2twYXRjaCBkb2N1bWVudGF0aW9uIGNhbiBiZSB2aWV3ZWQgZnJvbSB0aGUga2Vy
bmVsIHJvb3QKYXQgYERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2NoZWNrcGF0Y2gucnN0YC4KClRv
IGJ1aWxkIHRoZSBkb2N1bWVudGF0aW9uIG1ha2Ugc3VyZSB5b3UgaGF2ZSBjb25maWd1cmVkIHNw
aHlueAplaXRoZXIgaW4gdGhlIHN5c3RlbSBvciBpbiBhIHB5dGhvbiB2aXJ0dWFsZW52LiBOZXh0
IHRoZSBrZXJuZWwKZG9jIGNhbiBiZSBidWlsdCB1c2luZzoKCmBgYC9iaW4vYmFzaAptYWtlIGh0
bWxkb2NzCmBgYAoKIyMgSG93IHRvIGNvbnRyaWJ1dGUgdG8gdGhlIGRvY3VtZW50YXRpb24/CgpU
aGUgZG9jdW1lbnRhdGlvbiBpcyBzdGlsbCBhIHdvcmsgaW4gcHJvZ3Jlc3MuIEZlZWwgZnJlZSB0
byBzZW5kCnRoZSBwYXRjaGVzIHRvIHRoZSBrZXJuZWwtZG9jIG1haWxpbmcgbGlzdCwgYW5kIGFk
ZCBtZSAoRHdhaXBheWFuClJheSA8ZHdhaXBheWFucmF5MUBnbWFpbC5jb20+KSBhbmQgTHVrYXMg
KEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPikgZm9yIHJldmlld2luZyBp
dC4KClRoZSBkb2N1bWVudGF0aW9uIGlzIHdyaXR0ZWQgaW4gcnN0IHN5bnRheC4gUmVmZXIKW2hl
cmVdKGh0dHA6Ly9vcGVuYWxlYS5nZm9yZ2UuaW5yaWEuZnIvZG9jL29wZW5hbGVhL2RvYy9fYnVp
bGQvaHRtbC9zb3VyY2Uvc3BoaW54L3Jlc3Rfc3ludGF4Lmh0bWwpIGZvciBhIHF1aWNrIGd1aWRl
LgoKQmVmb3JlIHNlbmRpbmcgb3V0IHRoZSBtYWlsLCBwbGVhc2UgYWx3YXlzOgoKPiAtIGNoZWNr
cGF0Y2gucGwgeW91ciBjaGFuZ2VzCj4gLSBidWlsZCBjaGVjayB5b3VyIHBhdGNoIChpbiB0aGlz
IGNhc2UgY2hlY2sgdGhlIGdlbmVyYXRlZCBodG1sIGRvY3MpCj4gLSBzcGVsbCBjaGVjayB5b3Vy
IHBhdGNoICh0aGlzIGNhbiBiZSBlYXNpbHkgZG9uZSB0aHJvdWdoIGNoZWNrcGF0Y2gKPiAgIHVz
aW5nIC0tY29kZXNwZWxsIGZsYWcgaWYgeW91IGFscmVhZHkgaGF2ZSB0aGUgY29kZXNwZWxsIGRp
Y3Rpb25hcnkpCgojIyBBY2tub3dsZWRnZW1lbnRzCgpEdXJpbmcgbXkgbWVudG9yc2hpcCBwZXJp
b2QgSSBsZWFybmVkIGEgbG90IGZyb20gbXkgbWVudG9ycy4gCkkgd291bGQgbGlrZSB0byB0aGFu
ayBMdWthcyBmb3IgaGlzIGNvbnN0YW50IHN1cHBvcnQgYXMgbXkgbWVudG9yLApKb2UgZm9yIGhp
cyBndWlkYW5jZSB3aXRoIGNoZWNrcGF0Y2ggYW5kIGV2ZXJ5b25lIGluIHRoZSBjb21tdW5pdHkg
Zm9yIGJlaW5nIHN1Y2gKYW1hemluZyBwZW9wbGUuCgpUaGUga2VybmVsIGNvbnRyaWJ1dGlvbiBw
cm9jZXNzIG1heSBsb29rIG9sZCBidXQgaXQgd29ya3MuIFRoaXMgaXMgZHVlIHRvIHRoZSBkZWRp
Y2F0aW9uIG9mIGV2ZXJ5b25lIGluIHRoZSBjb21tdW5pdHksIHdoaWNoIEkgYW0gZ2xhZCB0byBi
ZSBhIHBhcnQgb2Yu
--0000000000009256d005bd5a7511
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--0000000000009256d005bd5a7511--
