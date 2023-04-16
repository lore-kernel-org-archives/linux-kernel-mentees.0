Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE77C77B76
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Apr 2023 10:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911B941FB2;
	Sun, 16 Apr 2023 10:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 911B941FB2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dQmdjtW/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXsb1BGNrt9i; Sun, 16 Apr 2023 10:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 00B5041F98;
	Sun, 16 Apr 2023 10:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B5041F98
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF0C1C0037;
	Sun, 16 Apr 2023 10:02:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF28BC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 10:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 753A26139A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 10:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753A26139A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dQmdjtW/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwt_o39rz0Pv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 10:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA75C60F4A
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA75C60F4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 10:02:09 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id bn8so20397558qtb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Apr 2023 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681639328; x=1684231328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZxoONYjpiy9MbL4YVRp8r9eBFiaHPQlZt2qQpuRD4E=;
 b=dQmdjtW//P7QvRzA1jFWg/37TrB91+CVHWJc7uOBy7vtwvOCFesVXJJFUUNR0Okvtz
 1n2croOfOLaaYQG6dneCb9LUqgG4SD7keQYz8A/4ofuVJpBCpJwcUIMACAYe0rOwzBuQ
 XdfooiY2KlxVs05fT/BCO30VDjxsJZRFLbGTZOlA0+EcFCkOXiG3j/ZAkf9pQIeiOLgt
 kkpL6CfRQTvHpAokWVtJGXiQsXeW8ekJf0GK3FB6UcaRtpHP9uKd9YHzJPVGtUYaxFZ0
 VTBsTtqEtiY+Fhh8rn5nzk6MY9ItvL6J0pwQklkGRIPPM33JFwRm4qX2C0IliDIB24pD
 7Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681639328; x=1684231328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZxoONYjpiy9MbL4YVRp8r9eBFiaHPQlZt2qQpuRD4E=;
 b=dyyggqPr5xPpdE2VHg1agK6Clb5jq+yXScs7vDeQpZw8QTmg7JbbKTUaKAkZBtFZpL
 6Pz10ca0FzAdwr+gwChGlq/9x9JkBlqj+JudD50ayFZwYktly44bQZ6ew3krfVzmJS27
 PJinSuXUvsE80+AjCymP9LXjdaL5ko092wYVaoMB3Gdg9ud/sz4BjCcnTkv2RgZA6wYB
 JZVwtHA3k/taLrtVhV9MzdAp4KPP8ny/9D5XBJo1jfD27ypcJHqUuuHVPmPX1pI4smHJ
 zUei+2I4WHYrr2qjpMOwTO+xRlb4vCkHQ0a18ILQGwUoGC03aNTWMriIkQPEzrTNOErl
 posQ==
X-Gm-Message-State: AAQBX9dN5oFMx4x3FN2pJ8nhX3Kl6vnouc7GLmGr4dWkxOCUXOclkta2
 3btllqHj++MUEE/hDxJMhEtft/6zXP9vKV7Wkjk=
X-Google-Smtp-Source: AKy350Z47+6bGxd1xRNHZnacl2G7aVI+x9MNtKPtsyKz0oTUv0XV1DinXFuPbSmxP5mkntBADuGSYGcFlwRkwkGdGGQ=
X-Received: by 2002:a05:622a:1a9b:b0:3e8:f79d:bdfa with SMTP id
 s27-20020a05622a1a9b00b003e8f79dbdfamr3499947qtc.0.1681639328272; Sun, 16 Apr
 2023 03:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <ZDuhnLPczec5qJnq@yoga>
In-Reply-To: <ZDuhnLPczec5qJnq@yoga>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 16 Apr 2023 13:01:32 +0300
Message-ID: <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
Subject: Re: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
To: Anup Sharma <anupnewsmail@gmail.com>
Cc: andy@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com,
 sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

T24gU3VuLCBBcHIgMTYsIDIwMjMgYXQgMTA6MjDigK9BTSBBbnVwIFNoYXJtYSA8YW51cG5ld3Nt
YWlsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGaXggZm9sbG93aW5nIGNoZWNrcGF0Y2gucGwgd2Fy
bmluZyBieSBpbmNsdWRpbmcKPiA8bGludXgvcHJvY2Vzc29yLmg+IGluc3RlYWQgb2YgPGFzbS9w
cm9jZXNzb3IuaD4KCk1pc3NpbmcgcGVyaW9kIGF0IHRoZSBlbmQuIEJ1dCB0aGUgZW50aXJlIHBh
dGNoIHNlZW1zIHVubmVjZXNzYXJ5CnNpbmNlIGl0J3MgYWxsIGFib3V0IHg4NiwgYW5kIHdlIGhh
dmUgbW9yZSBhcmNoIGhlYWRlcnMgdGhlcmUgYW55d2F5LgpBbnl3YXkgaXQncyB1cCB0byBIYW5z
LiBBbHNvIHNlZSBiZWxvdy4KCi4uLgoKPiAgI2luY2x1ZGUgPGFzbS9pbnRlbC1mYW1pbHkuaD4K
PiAtI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Byb2Nlc3Nv
ci5oPgo+Cj4gICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KPiAgI2luY2x1ZGUgPG1lZGlhL3Y0bDIt
c3ViZGV2Lmg+CgpUaGlzIHNlZW1zIGEgYml0IGNoYW90aWMgd2l0aCB0aGUgb3JkZXJpbmcgb2Yg
dGhlIGhlYWRlcnMgaGVyZS4KCi4uLgoKSWYgeW91IHdhbnQgYSBnb29kIHBhdGNoLCB5b3UgbmVl
ZCB0byB1bmRlcnN0YW5kIHdoYXQgaGVhZGVycyBhcmUKX3JlYWxseV8gYmVpbmcgdXNlZCBpbiB0
aGUgaGVhZGVyIGZpbGUuIFRoZW4gZHJvcCB1bnVzZWQsIHRyeSB0bwpjb21waWxlIHRoYXQgYW5k
IGZpeCBhbGwgZmlsZXMgdGhhdCB3aWxsIGhhdmUgbWlzc2luZyBoZWFkZXJzIGFmdGVyCnRoYXQu
IFRoaXMgd2lsbCBiZSBhIHZlcnkgdXNlZnVsIGNsZWFuIHVwIQoKLS0gCldpdGggQmVzdCBSZWdh
cmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
