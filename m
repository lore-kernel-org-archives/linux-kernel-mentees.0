Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73258CD6130
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 19:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F40EF41496;
	Mon,  9 Oct 2023 19:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40EF41496
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kq3nIHiZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnSd5pycB0wP; Mon,  9 Oct 2023 19:50:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9140541506;
	Mon,  9 Oct 2023 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9140541506
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71A2CC0039;
	Mon,  9 Oct 2023 19:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA161C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C247481B69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C247481B69
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kq3nIHiZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWBe4jgpCARA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:50:40 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B1B181B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B1B181B01
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bfea381255so59151741fa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Oct 2023 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696881038; x=1697485838;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCvsz/h9TY+Rnr8NBomSPRGnNvjlH7+ApWAJqBGhCEg=;
 b=Kq3nIHiZ5tnkIiSJH44p45l6eYbvLwmXNfepmc8p7WcC1fFF8w4eeO2YbC69u7uhn5
 ja6UCgNRi9pZ+OQO51yJTKRppceMYjNnjAk99/FAjfNSrSdZJXaqEmrCI+fwzQHkk06x
 BRfuOYU/ZO2pcPgkvhLjlN9wlnhqgviuv0NXVoo6+AV8gvYbldukWngvohUG0sYIVRXx
 KbK7t0HdGWvRPLFm0GHFZR49gPbvusfgBba5HbUSR2mfIkt3J6u15bMpVKzdA1AAJpeX
 7FXiGwT2FJ+LCRncVjJg4Kuh1mUQ+DIZaTbhiERqcQiuFCntIkgpTzQajxYXOuODEhri
 e6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696881038; x=1697485838;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCvsz/h9TY+Rnr8NBomSPRGnNvjlH7+ApWAJqBGhCEg=;
 b=vJgJNeTXHuN+oD0BnShsYqsa8CegmUBDhOfHmiI25zblXkXxkbUtgCyhR2mD+Gj642
 ZvgCVDqRbLBXiLg+6oNKRt3mKGTlMrBGXf6XMuBQWXK2ctdsRpHInMMb76tvIbdtMuU8
 s2Q6gw8s/tkuLiIjoy7YqYE0SjoEl/+ITqU2cgkihH3r6Fmlh/vHbwAs2GoyVLvfEanJ
 Y/tDY5BKszzNKI79oYcgY5E5Jlsmchm/v1KAYVpf3nelI5sgs9IeWKaczTRpbLUZq8Ce
 xmpbcGZng/8t1xC5uPZ5DxPjcxux413oXjDvPz+P8nHn/WnDp4zWX/9COxV/NAGNo/gK
 rhEQ==
X-Gm-Message-State: AOJu0YwF7jkLIxt3b1OiHaqGiUJBaa93OtKHce1/GYqd8c10heubQiC/
 Zwp5oX2ssIcqHEWHdfWsfxpkg6zZp9d9FX0qwSk=
X-Google-Smtp-Source: AGHT+IFNib/1FUNelTBPZnwQ/ETGlj8YvjAwySBKGvclQsR9YBcZA+xkI0lQqbNwNHP+Qem/GR4XTlG4ASBXd4PG/Yc=
X-Received: by 2002:a2e:998e:0:b0:2ba:18e5:1064 with SMTP id
 w14-20020a2e998e000000b002ba18e51064mr14217882lji.14.1696881037531; Mon, 09
 Oct 2023 12:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <AM9P192MB12672AA34A0480B522D23741E8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
 <2023100727-passive-untidy-8df4@gregkh>
 <AM9P192MB1267C58F299DF86A5EEFE39EE8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <AM9P192MB1267C58F299DF86A5EEFE39EE8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 9 Oct 2023 12:50:25 -0700
Message-ID: <CABBYNZLA2aTwRFqeDNLaT6Q4cytLB1e-q5oON=KVK1ts-0dz1w@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 "marcel@holtmann.org" <marcel@holtmann.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com"
 <syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

SGkgWXVyYW4sCgpPbiBTYXQsIE9jdCA3LCAyMDIzIGF0IDEwOjM54oCvQU0gWXVyYW4gUGVyZWly
YSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBHcmVnLAo+IE15
IGFwb2xvZ2llcywgSSBqdXN0IG5vdGljZWQgdGhhdCBteSBwYXRjaCBpcyBiYXNlZCBvbiB0aGUg
bWFpbmxpbmUgdHJlZS4gSSdsbCByZS1zdWJtaXQgb25lIGJhc2VkIG9uIHRoZSBCbHVldG9vdGgg
dHJlZSBhbmQgSSdsbCBlbnN1cmUgdG8gaW5jbHVkZSB0aGUgY29tbWl0IGlkIHRoYXQgaXQncyBm
aXhpbmcuCj4KPiBUaGFua3MsCj4gWXVyYW4gUGVyZWlyYQo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gRGU6IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+
IEVudmlhZG86IDcgZGUgb3V0dWJybyBkZSAyMDIzIDExOjQxCj4gUGFyYTogWXVyYW4gUGVyZWly
YSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4KPiBDYzogbWFyY2VsQGhvbHRtYW5uLm9yZyA8
bWFyY2VsQGhvbHRtYW5uLm9yZz47IGpvaGFuLmhlZGJlcmdAZ21haWwuY29tIDxqb2hhbi5oZWRi
ZXJnQGdtYWlsLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIDxsaW51
eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnPjsgbHVpei5kZW50ekBnbWFpbC5jb20gPGx1aXou
ZGVudHpAZ21haWwuY29tPjsgc3l6Ym90KzM5ZWMxNmZmNmNjMThiMWQwNjZkQHN5emthbGxlci5h
cHBzcG90bWFpbC5jb20gPHN5emJvdCszOWVjMTZmZjZjYzE4YjFkMDY2ZEBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tPjsgbGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZyA8bGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZz4KPiBB
c3N1bnRvOiBSZTogW1BBVENIXSBCbHVldG9vdGg6IGhjaV9jb25uX2ZhaWxlZDogRml4ZXMgbWVt
b3J5IGxlYWsKPgo+IE9uIFNhdCwgT2N0IDA3LCAyMDIzIGF0IDA1OjA5OjAxUE0gKzA1MzAsIFl1
cmFuIFBlcmVpcmEgd3JvdGU6Cj4gPiBUaGUgaGNpX2Nvbm5fZmFpbGVkKCkgZnVuY3Rpb24gY3Vy
cmVudGx5IGNhbGxzIGhjaV9jb25uZWN0X2NmbSgpLCB3aGljaAo+ID4gaW5kaXJlY3RseSBsZWFk
cyB0byB0aGUgYWxsb2NhdGlvbiBvZiBhbiBsMmNhcF9jb25uIHN0cnVjdCBpbiBsMmNhcF9jb25u
X2FkZCgpLgo+ID4gVGhpcyBvcGVyYXRpb24gcmVzdWx0cyBpbiBhIG1lbW9yeSBsZWFrLCBhcyB0
aGUgbDJjYXBfY29ubiBzdHJ1Y3R1cmUKPiA+IGJlY29tZXMgdW5yZWZlcmVuY2VkLgo+ID4KPiA+
IFRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBhbmQgcHJldmVudCB0aGUgbWVtb3J5IGxlYWssIHRoaXMg
cGF0Y2ggbW9kaWZpZXMKPiA+IGhjaV9jb25uX2ZhaWxlZCgpIHRvIHJlcGxhY2UgdGhlIGNhbGwg
dG8gaGNpX2Nvbm5lY3RfY2ZtKCkgd2l0aCBhCj4gPiBjYWxsIHRvIGhjaV9kaXNjb25uX2NmbSgp
LgoKSSBzdXNwZWN0IHRoaXMgaXMgbm90IHF1aXRlIHJpZ2h0LCBoY2lfZGlzY29ubl9jZm0gaXMg
Y2FsbGVkIHdoZW4gYQpkaXNjb25uZWN0aW9uIGhhcyBiZWVuIHJlcXVlc3RlZCwgaGNpX2Nvbm5l
Y3RfY2ZtIGlzIGNvcnJlY3QgaGVyZQpzaW5jZSBpdCBpcyBtZWFudCB0byBub3RpZnkgdGhlIHJl
c3VsdCBvZiBjb25uZWN0aW9uIHJlcXVlc3QgcHJvY2VkdXJlCnNvIEkgY2FuIG9ubHkgYXNzdW1l
IHRoYXQgdGhlIGN1bHByaXQgaGVyZSBpcyB0aGF0IGhjaV9jb25uX2ZhaWxlZCBpcwpjYWxsZWQg
d2l0aCBzdGF0dXMgMCB3aGljaCBpcyBpbnZhbGlkIGFuZCBuZWVkcyBmaXhpbmcuCgo+ID4gUmVw
b3J0ZWQtYnk6IHN5emJvdCszOWVjMTZmZjZjYzE4YjFkMDY2ZEBzeXprYWxsZXIuYXBwc3BvdG1h
aWwuY29tCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdXJhbiBQZXJlaXJhIDx5dXJhbi5wZXJlaXJhQGhv
dG1haWwuY29tPgo+ID4gLS0tCj4gPiAgbmV0L2JsdWV0b290aC9oY2lfY29ubi5jIHwgMiArLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gV2hh
dCBjb21taXQgaWQgZG9lcyB0aGlzIGZpeD8KPgo+IHRoYW5rcywKPgo+IGdyZWcgay1oCgoKCi0t
IApMdWl6IEF1Z3VzdG8gdm9uIERlbnR6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1r
ZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
