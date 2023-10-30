Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB188C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 22:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5267F60EC4;
	Mon, 30 Oct 2023 22:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5267F60EC4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgwkVqqL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMnMoLDsp--M; Mon, 30 Oct 2023 22:38:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 29CEE60E4E;
	Mon, 30 Oct 2023 22:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CEE60E4E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08261C0039;
	Mon, 30 Oct 2023 22:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D53F1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 22:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B034D8214B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 22:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B034D8214B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgwkVqqL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C27GY20ZqeYW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 22:38:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF4AE82124
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 22:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF4AE82124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698705518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVen+98WnwQurJDGWUrJb3G/4jC7KQVwkhzvb2b+SJw=;
 b=MgwkVqqLFWWDkMoQlLl5ieDVDvvKLeVkHH2BO2mtGAREY1hzuywsTnxlYNrtP6wGoatvzE
 BHSwe2VS2892ei3sHnVPb1Vhmckd7IfU5/f4XtOQHOLuVJkZOaNavMUhbRHCe2sfwQ6MJe
 +9aNk0lsMgLWsPpH0hG+0eV04D3RhAI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-7V84xJAmOZOdeV4lCso15Q-1; Mon, 30 Oct 2023 18:38:37 -0400
X-MC-Unique: 7V84xJAmOZOdeV4lCso15Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1cc41aed6a5so12217795ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 15:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698705516; x=1699310316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVen+98WnwQurJDGWUrJb3G/4jC7KQVwkhzvb2b+SJw=;
 b=uLtaai8PwcMT/1148sioTlPFM87ty57+jBYbRhaIfI3G7DN2bw+tYXoViYU3kzwgHK
 VyURzwZXiATXDDGP3N+R3cHLpq90wUdnja733ddAhMBHgFW0LcCZJ8ngISFt8/cvEwzO
 csAc6UUIZscHVMsA7kk2eMB85R8OD5Sm1ZKGNoK33L3BCqLlOLhc0bpQE6ifML6iL2DI
 7KnIWWSJ40DaF5hyCV7pO99OdOReajgVU8N0RkaqKqOGVE/6/gSUoQypQT5wXSXKvr8u
 HLL4VLur5dj5iEZ5D+zlBmuM1mh/W1fJMqNhdzIPit9bvwwWIAC1V+nPUsZ0uZbWuUbV
 sn2Q==
X-Gm-Message-State: AOJu0YxctxnTRBkkqr6PedhBY61NubyH1aFz9QsgBM8GsdoDQC1/gxnV
 FZ99hqKfBEPESdGeAyh/BsfcuMvL6To75GgIu26dI0nmIHFaPbSD2MfP7uTWNBy6IoOxvfnqQPB
 fcszWKXp8ol66GvY8Flr4fcEjdJcwVa3KiCA2fpSCrGlJRbLFPZkYPaioAInY/cRN
X-Received: by 2002:a17:903:2448:b0:1c9:b2c1:13a3 with SMTP id
 l8-20020a170903244800b001c9b2c113a3mr9944348pls.49.1698705516014; 
 Mon, 30 Oct 2023 15:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrq6wv4fAKDM89bR7AcFO6+rXEiZBdcum9FGjplZFEeTMyDffvE1uHbFQRJVOR54meCmmTMypGBZ3ZfVNBW9k=
X-Received: by 2002:a17:903:2448:b0:1c9:b2c1:13a3 with SMTP id
 l8-20020a170903244800b001c9b2c113a3mr9944338pls.49.1698705515709; Mon, 30 Oct
 2023 15:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB0752B3C3E2DF69C56BF5D6D199A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752B3C3E2DF69C56BF5D6D199A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 30 Oct 2023 23:38:24 +0100
Message-ID: <CAHc6FU41DktH6+Hxsv3kYSiXenjoLJ58P6+mO9Yjhex5M0=aVA@mail.gmail.com>
Subject: Re: [PATCH] fs/gfs2: Fix slab-use-after-free in gfs2_qd_dealloc
To: Juntong Deng <juntong.deng@outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: rpeterso@redhat.com, gfs2@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+29c47e9e51895928698c@syzkaller.appspotmail.com
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

SGVsbG8gSnVudG9uZywKCk9uIFN1biwgT2N0IDI5LCAyMDIzIGF0IDEwOjEx4oCvUE0gSnVudG9u
ZyBEZW5nIDxqdW50b25nLmRlbmdAb3V0bG9vay5jb20+IHdyb3RlOgo+IEluIGdmczJfcHV0X3N1
cGVyKCksIHdoZXRoZXIgd2l0aGRyYXduIG9yIG5vdCwgdGhlIHF1b3RhIHNob3VsZAo+IGJlIGNs
ZWFuZWQgdXAgYnkgZ2ZzMl9xdW90YV9jbGVhbnVwKCkgYW5kIHdhaXQgZm9yIGFsbCBxdW90YSB0
bwo+IGJlIGRlYWxsb2NhdGVkLgo+Cj4gT3RoZXJ3aXNlIHN0cnVjdCBnZnMyX3NiZCBoYXMgYmVl
biBmcmVlZCBiZWZvcmUgZ2ZzMl9xZF9kZWFsbG9jCj4gKHJjdSBjYWxsYmFjaykgaXMgY29tcGxl
dGVkLCByZXN1bHRpbmcgaW4gdXNlLWFmdGVyLWZyZWUuCj4KPiBBbHNvLCBnZnMyX2Rlc3Ryb3lf
dGhyZWFkcygpIGFuZCBnZnMyX3F1b3RhX2NsZWFudXAoKSBoYXZlCj4gYWxyZWFkeSBiZWVuIGNh
bGxlZCBpbiBnZnMyX21ha2VfZnNfcm8oKSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0bwo+IGNhbGwg
dGhlbSBhZ2FpbiBzdWJzZXF1ZW50bHksIHdoZXRoZXIgd2l0aGRyYXduIG9yIG5vdC4KPgo+IFJl
cG9ydGVkLWJ5OiBzeXpib3QrMjljNDdlOWU1MTg5NTkyODY5OGNAc3l6a2FsbGVyLmFwcHNwb3Rt
YWlsLmNvbQo+IENsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlk
PTI5YzQ3ZTllNTE4OTU5Mjg2OThjCj4gU2lnbmVkLW9mZi1ieTogSnVudG9uZyBEZW5nIDxqdW50
b25nLmRlbmdAb3V0bG9vay5jb20+Cj4gLS0tCj4gIGZzL2dmczIvc3VwZXIuYyB8IDEwICsrKysr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9mcy9nZnMyL3N1cGVyLmMgYi9mcy9nZnMyL3N1cGVyLmMKPiBpbmRl
eCBhNGIzNjU1YzUzNjEuLmQyMWMwNGEyMmQ3MyAxMDA2NDQKPiAtLS0gYS9mcy9nZnMyL3N1cGVy
LmMKPiArKysgYi9mcy9nZnMyL3N1cGVyLmMKPiBAQCAtNjAyLDEzICs2MDIsMTUgQEAgc3RhdGlj
IHZvaWQgZ2ZzMl9wdXRfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYikKPiAgICAgICAgIH0K
PiAgICAgICAgIHNwaW5fdW5sb2NrKCZzZHAtPnNkX2ppbmRleF9zcGluKTsKPgo+IC0gICAgICAg
aWYgKCFzYl9yZG9ubHkoc2IpKSB7Cj4gKyAgICAgICBpZiAoIXNiX3Jkb25seShzYikpCj4gICAg
ICAgICAgICAgICAgIGdmczJfbWFrZV9mc19ybyhzZHApOwo+IC0gICAgICAgfQo+IC0gICAgICAg
aWYgKGdmczJfd2l0aGRyYXduKHNkcCkpIHsKPiAtICAgICAgICAgICAgICAgZ2ZzMl9kZXN0cm95
X3RocmVhZHMoc2RwKTsKPiArICAgICAgIGVsc2Ugewo+ICsgICAgICAgICAgICAgICBpZiAoZ2Zz
Ml93aXRoZHJhd24oc2RwKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBnZnMyX2Rlc3Ryb3lf
dGhyZWFkcyhzZHApOwo+ICsKPiAgICAgICAgICAgICAgICAgZ2ZzMl9xdW90YV9jbGVhbnVwKHNk
cCk7Cj4gICAgICAgICB9Cj4gKwo+ICAgICAgICAgV0FSTl9PTihnZnMyX3dpdGhkcmF3aW5nKHNk
cCkpOwo+Cj4gICAgICAgICAvKiAgQXQgdGhpcyBwb2ludCwgd2UncmUgdGhyb3VnaCBtb2RpZnlp
bmcgdGhlIGRpc2sgICovCj4gLS0KPiAyLjM5LjIKCnRoYW5rcyBmb3IgdGhpcyBmaXgsIEkndmUg
bWVyZ2VkIGl0LgoKQW5kcmVhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
