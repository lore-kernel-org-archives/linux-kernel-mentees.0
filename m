Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B754C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 07:26:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2CC420882
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 07:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly1kUaeL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2CC420882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2355087117;
	Sun, 25 Oct 2020 07:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXTksWXSvD5R; Sun, 25 Oct 2020 07:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 063D187113;
	Sun, 25 Oct 2020 07:26:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2FF1C088B;
	Sun, 25 Oct 2020 07:26:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F204C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 07:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2F47B20347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilT6MIyOrAzO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 07:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A289D20334
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 07:26:07 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w191so7288379oif.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=avXKu6uAU5kWu0ba2soGiHoHAgyWyS1zrTphsAmFAWE=;
 b=ly1kUaeLfWCwJ/Dm2m0Js2f9Yc42la3WjXS8cuJ0rV75Z13uiruI4tRl9h9HaL+wU7
 qaW/H7TmUiZXP3hDOGrOGDpuk92IODcl48Vvij26o0L6idGDZlcjyhwZQ4hz0VHl8sRo
 FBcTr5n/yK8+1m7AhXCsi7IQ5beQGMbca96Lf7VGrOF9Z26Mlq6wjwMq18nk1De+QcNV
 vnP6RfL2YT+7AnQqc2hW2DaIBxFBIDSUKUdeitehEW3Qom/JatEqbfg3fwgIsI9xyEez
 UEUj/2l2ScF1gaN7D+cgO0I9c5zlQcd0IHRkL7Tb6+HIfgFh+Ns1I53o7EpdZCiJcvzF
 yQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=avXKu6uAU5kWu0ba2soGiHoHAgyWyS1zrTphsAmFAWE=;
 b=oI9OmGhlJJq1UUbyeDE3qdaA9IfujW+WaJV+ZbWq0pjvNLTwCXdJX5jxy3xnpSgGRb
 UeoL9ur9X1q9zmM6UrY6AaR51oD+nbdNg7v1G21aDd34RzW54MMun/74wQX8VemmYxbR
 tKUNvuDq8xIuBbsExWNFDWkN15A2WJV9iWHZHDTirVGIm9A2bhqtsP4LAs6cymzNDwjV
 H7ruE3P42yDMIlsXqtaAbqo/jxw3JxBJ0kEvtvwmum4t3U9DfTHPB6R+B1IBNiLpyVqB
 rota9OZTwKAsYX5NjqONGyya4Js7Chu/rtf8Sk97dcW9Pq2wWZ4HZtrwrMzmkJlM60lD
 Wk1g==
X-Gm-Message-State: AOAM533BLgiMhOmLSYpIvjXgqX5GaY/bVp/6hlogjz/OHkr6mfdx6tg3
 2H+J3fx9hZmlDnz+B1JuxvfEuEB2EbjIwWmieeE=
X-Google-Smtp-Source: ABdhPJy649qZtTv2LlstTp4KqAF4LhzrnibV0U9ztFR/6cFzBAv6q6v3hWN3HMqZBI6tRNeT116N+ZZXS8nE+XfBAZY=
X-Received: by 2002:aca:420a:: with SMTP id p10mr6889503oia.117.1603610766551; 
 Sun, 25 Oct 2020 00:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
 <alpine.DEB.2.21.2010210717460.8328@felia>
 <CABJPP5CQgkzYnq6KrwfAaaTbORLVSKqxdF=8-eM8stPtJOXOjQ@mail.gmail.com>
 <alpine.DEB.2.21.2010211053430.8328@felia>
In-Reply-To: <alpine.DEB.2.21.2010211053430.8328@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 12:55:37 +0530
Message-ID: <CABJPP5BYmRrHng6taVVVyYgmD=N6iojUWH0Tk4v9ih+24vWFfA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch: improving comment parsing in
	email
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

T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMjoyNiBQTSBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3
YWhuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gV2VkLCAyMSBPY3QgMjAyMCwgRHdhaXBh
eWFuIFJheSB3cm90ZToKPgo+ID4gT24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMTE6MDEgQU0gTHVr
YXMgQnVsd2FobiA8bHVrYXMuYnVsd2FobkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPgo+
ID4gPgo+ID4gPiBPbiBUdWUsIDIwIE9jdCAyMDIwLCBEd2FpcGF5YW4gUmF5IHdyb3RlOgo+ID4g
Pgo+ID4gPiA+IEhpLAo+ID4gPiA+IGNoZWNrcGF0Y2ggc2VlbXMgdG8gaGF2ZSBwcm9ibGVtcyBw
YXJzaW5nIHNvbWUgdHlwZXMgb2YKPiA+ID4gPiBlbWFpbCBjb21tZW50cy4gU29tZSBleGFtcGxl
cyBJIGNvdWxkIGZpbmQgd2VyZSBvZiB0aGUgdHlwZToKPiA+ID4gPgo+ID4gPiA+IDEpIGFkZHJl
c3NAZXhhbXBsZS5jb20gKENvbW1lbnQpCj4gPiA+ID4gMikgIk5hbWUgKENvbW1lbnQpICIgYWRk
cmVzc0BleGFtcGxlLmNvbQo+ID4gPiA+IDMpIGFkZHJlc3NAZXhhbXBsZS5jb20gI2NvbW1lbnQK
PiA+ID4gPgo+ID4gPiA+IFRoZXNlIGNvbW1lbnRzIGFyZW4ndCBwcm9jZXNzZWQgY3VycmVudGx5
IHdoaWNoIGNhdXNlcwo+ID4gPiA+IGZhbHNlIEJBRF9TSUdOX09GRiB3YXJuaW5ncy4KPiA+ID4g
Pgo+ID4gPiA+IEV4YW1wbGVzIGFyZToKPiA+ID4gPgo+ID4gPiA+IFdBUk5JTkc6QkFEX1NJR05f
T0ZGOiBlbWFpbCBhZGRyZXNzICdEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbQo+ID4gPiA+IChiaWcg
ZW5kaWFuIHN5c3RlbSBjb25jZXJucyknIG1pZ2h0IGJlIGJldHRlciBhcyAnRGF2aWQuTGFpZ2h0
QGFjdWxhYi5jb20KPiA+ID4gPiAoYmlnIGVuZGlhbiBzeXN0ZW0gY29uY2VybnMpJwo+ID4gPiA+
Cj4gPiA+ID4gV0FSTklORzpCQURfU0lHTl9PRkY6IGVtYWlsIGFkZHJlc3MgJ3N0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgIzQuMjArJwo+ID4gPiA+IG1pZ2h0IGJlIGJldHRlciBhcyAnc3RhYmxlQHZn
ZXIua2VybmVsLm9yZyM0LjIwKycKPiA+ID4gPgo+ID4gPiA+IFRoZSBlYXJsaWVyIHdhcm5pbmcg
aXMgdmVyeSBmcmVxdWVudCBpbiB0aGUga2VybmVsLgo+ID4gPiA+Cj4gPiA+ID4gSSBkaWQgc2Vu
ZCBhIHBhdGNoIHNvbHZpbmcgKDEgYW5kIDMpLAo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWtlcm5lbC1tZW50ZWVzL2ExNWE2Y2MwZGRlYTA2OGQ3ODExM2Y1ZTMxNWVhYmE2
ZjUyYjkxN2EuY2FtZWxAcGVyY2hlcy5jb20vCj4gPiA+ID4KPiA+ID4gPiBKb2UgcG9pbnRzIG91
dCB0aGF0IGNvbW1lbnRzIGFuZCBtdWx0aXBsZSBjb21tZW50cyBjYW4KPiA+ID4gPiBleGlzdCBh
dCBhbnkgcGFydCBvZiBlbWFpbC4gKHBlcmhhcHMgUkZDIDUzMjIgQXBwZW5kaXggQS41KS4gU28K
PiA+ID4gPiB0aGF0IHBhdGNoIGRpZG4ndCBzb2x2ZSB0aGUgcHJvYmxlbSBhdCB0aGUgdmVyeSBy
b290Lgo+ID4gPiA+Cj4gPiA+ID4gV2hhdCBkbyB5b3UgcmVjb21tZW5kIGJlIGRvbmU/Cj4gPiA+
ID4KPiA+ID4KPiA+ID4gSSBjYW5ub3Qgc2F5IG11Y2ggb2YgQklHIHZhbHVlIGFuZCBpbnNpZ2h0
Lgo+ID4gPgo+ID4gPiBBcyBvZiBub3csIEkgdGhpbmsgdGhlc2UgY2FzZXMgc2hvdWxkIGJlIGhh
bmRsZWQgY29ycmVjdGx5IGFuZCB0aGUgY2hlY2sKPiA+ID4gZm9yOiBpcyBpdCB0aGUgc2FtZSBu
YW1lIG9yIGlzIGl0IHRoZSBzYW1lIGVtYWlsIHNob3VsZCB3b3JrIHByb3Blcmx5IG5vCj4gPiA+
IG1hdHRlciB3aGVyZSBhbmQgd2hpY2gga2luZCBvZiBjb21tZW50IGlzIHVzZWQgKGFzIGRlc2Ny
aWJlZCBieSBSRkMgNTMyMgo+ID4gPiBhcyB5b3UgcG9pbnRlZCBvdXQpLgo+ID4gPgo+ID4gPiBJ
IG1pZ2h0IGNoYW5nZSBteSBvcGluaW9uIHdoZW46Cj4gPiA+Cj4gPiA+IDEuIFdlIGhhdmUgYW4g
ZXZhbHVhdGlvbiBvbiBob3cgbWFueSBjYXNlcyBvZiBCQURfU0lHTl9PRkYgKGFuZCByZWxhdGVk
Cj4gPiA+IHR5cGVzKSBkbyB3ZSBjdXJyZW50bHkgc3RpbGwgb2JzZXJ2ZWQgYW1vbmcgMTAwLDAw
MCBjb21taXRzIGFuZCBob3cgbWFueQo+ID4gPiBkdWUgdG8gbm90IGhhbmRsaW5nIGNvbW1lbnRz
IHByb3Blcmx5Pwo+ID4gPgo+ID4gPiAyLiBXZSBoYXZlIGEgcm91Z2ggaWRlYSBob3cgY29tcGxl
eCB0aGlzIHdob2xlIGNoZWNraW5nIGZ1bmN0aW9uIHdpbGwgZ2V0Lgo+ID4gPiBBdCB0aGUgbW9t
ZW50LCBJIGNhbm5vdCBzYXkgaWYgaXQgImp1c3QgMTAgbGluZXMgb2YgY29kZSBhZGRpdGlvbiIg
KGV2ZW4KPiA+ID4gaWYgdGhleSBtaWdodCBiZSBxdWl0ZSBpbnRyaW5zaWMgdG8gZ2V0IHJpZ2h0
KSBvciBpZiB3ZSBuZWVkIGh1bmRyZWRzIG9mCj4gPiA+IGxpbmVzIHdpdGggdGhvdXNhbmQgb2Yg
c3BlY2lhbCBjYXNlcyBldGMuICh3aGljaCBJIGRvIG5vdCBleHBlY3QsIGJ1dCB3aG8KPiA+ID4g
a25vd3Mgd2hpY2ggY29tcGxleGl0eSBtaWdodCBiZSBpbnZvbHZlZCwgb25jZSB3ZSBnbyBpbnRv
IHRoZSBkZXRhaWxzKS4KPiA+ID4KPiA+ID4gU28sIEkgc3VnZ2VzdCB0byBldmFsdWF0ZSBhbmQg
cHJvdG90eXBlIGFuZCB0aGVuIHdlIGNhbiBiZXR0ZXIganVkZ2UgaWYgaXQKPiA+ID4gaXMgd29y
dGggcmVhbGx5IGdvaW5nIGZvcndhcmQsIGRpc2N1c3NpbmcgaXQgd2l0aCBKb2VhbmQgYWRkaW5n
IGl0IHRvIG1haW5saW5lLgo+ID4gPgo+ID4gPgo+ID4gPiBXaGF0IGRvIHlvdSB0aGluaywgRHdh
aXBheWFuPwo+ID4gPgo+ID4KPiA+IEhpLAo+ID4gSSBjb21wbGV0ZWx5IGFncmVlIHdpdGggeW91
LiBXZSBjb3VsZCBydW4gdGhlIGV2YWx1YXRpb24gZmlyc3QgYW5kCj4gPiBzZWUgd2hhdCBraW5k
cyBvZiBjb21tZW50IHBhdHRlcm5zIGFyZSB1c2VkLiBXZSBjb3VsZCBhbHNvIGtlZXAKPiA+IHRo
ZSBSRkMgNTMyMiBndWlkZWxpbmVzIGFzIGEgYmFzZSBhbmQgbW9kaWZ5IHRoZSBjb2RlIHRvIHJl
Y29nbml6ZQo+ID4gdGhlIGNvbW1lbnQgYmxvY2tzIGFzIHBlciB0aGUgc3BlY2lmaWNhdGlvbnMu
Cj4gPgo+ID4gSXQgY291bGQgZ2V0IGZhaXJseSBjb21wbGV4LCBiZWNhdXNlIGNvbW1lbnQgYmxv
Y2tzIGFyZSBhbGxvd2VkIGFsbW9zdAo+ID4gYW55d2hlcmUuIFNvIG1heWJlIHdlIHNob3VsZCBq
dXN0IHNvbHZlIHRoZSBtb3N0Cj4gPiBjb21tb24gb25lcyBmaXJzdC4gVGhhdCB3b3VsZCBoZWxw
IHRoZSBjb21taXR0ZXJzIGxhcmdlbHkuCj4gPgo+ID4gSSB0aGluayBKb2Ugd2FudGVkIGEgY29t
cGxldGUgc29sdXRpb24gZm9yIGl0LiBTbyBJIGd1ZXNzIGkgd2lsbCB0cnkKPiA+IHRvIGNvdmVy
IGFzIG1hbnkgY2FzZXMgd2hpY2ggZG9lc24ndCBpbmNyZWFzZSB0aGUgY29kZSBjb21wbGV4aXR5
Cj4gPiBtdWNoLgo+ID4KPiA+IEkgd2lsbCBzdGFydCB3aXRoIHRoZSBldmFsdWF0aW9uLiBJZiBv
dGhlcnMgY2FuIGhlbHAgb3V0IHRvbyBpdCB3aWxsIGJlIGdyZWF0Lgo+ID4gQWZ0ZXIgaXQsIHdl
IGNhbiBkZXRlcm1pbmUgd2hhdCBjYXNlcyBuZWVkIHRvIGJlIGhhbmRsZWQgYW5kIHdoYXQKPiA+
IGNhbiBiZSBpZ25vcmVkLgo+ID4KPgo+IEdvIGZvciBpdCBhbmQgc2hhcmUgeW91ciByZXN1bHRz
IHdpdGggdGhlIGdyb3VwIG9uY2UgeW91IGhhdmUgc29tZXRoaW5nCj4gd2hpY2ggb3RoZXJzIGNh
biByZXZpZXcgYW5kIGhlbHAgdG8gZXZhbHVhdGUuCj4KPiBUaGUgcmVxdWlyZW1lbnQgZm9yIGZ1
dHVyZSBhcHBsaWNhbnRzIHRvIGJlIHNlbGVjdGVkIGlzIHRvIHNob3cgdGhhdCB0aGV5Cj4gY2Fu
IGhlbHAgeW91IHdpdGggdGhlaXIgd29yayBvbiBldmFsdWF0aW9ucyBhbmQgdGhlaXIgZXhwbGFu
YXRpb25zLgo+Cj4gTHVrYXMKCkhpLApTb3JyeSBJIHRvb2sgYSBiaXQgb2YgdGltZSBmb3IgdGhp
cy4gSXQgd2FzIGF3ZnVsbHkgc2xvdyBhbmQgSSBoYWQgdG8gY2FuY2VsCml0IHNldmVyYWwgdGlt
ZXMuCgpOZXZlcnRoZWxlc3MsIGhlcmUgaXMgbXkgcmVwb3J0LgpJIHJhbiBjaGVja3BhdGNoIG92
ZXIgNTAsMDAwIGNvbW1pdHMgZnJvbSB2NS40LgoKVGhlcmUgd2VyZToKMTUxNiBCQURfU0lHTl9P
RkYgd2FybmluZ3MuCgpvdXQgb2Ygd2hpY2g6Cjc5OCBCQURfU0lHTl9PRkY6IGVtYWlsIGFkZHJl
c3MgPGVtYWlsMT4gbWlnaHQgYmUgYmV0dGVyIGFzIDxlbWFpbDI+Cndhcm5pbmdzLgoKU2luY2Ug
dGhpcyB3YXMgdGhlIHBvdGVudGlhbCBlcnJvciBwb2ludCwgSSBkdWcgZGVlcGVyLCBhbmQgdGhl
cmUgd2VyZQoyOTMgQkFEX1NJR05fT0ZGOiBlbWFpbCBhZGRyZXNzICc8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyAuKicgbWlnaHQKYmUgYmV0dGVyIGFzIHdhcm5pbmdzLgoKVGhlcmUgYXJlIDY4
IG90aGVyIHBvdGVudGlhbCB3YXJuaW5ncywgc29tZSBvZiB3aGljaCBhcmUgYXJlIG9mIHR5cGU6
CgplbWFpbCBhZGRyZXNzICciS2FpIE3DpGtpc2FyYSAoS29sdW1idXMpIiA8a2FpLm1ha2lzYXJh
QGtvbHVtYnVzLmZpPicgbWlnaHQgYmUKIGJldHRlciBhcyAnIkthaSBNw6RraXNhcmEiKEtvbHVt
YnVzKSA8a2FpLm1ha2lzYXJhQGtvbHVtYnVzLmZpPicKClRoZSBuYW1lIGNvbW1lbnQgd2Fzbid0
IHBhcnNlZCBwcm9wZXJseSBkdWUgdG8gdGhlIHF1b3RlcyBoYW5kbGluZy4KClJlY3Vyc2l2ZSBw
YXJhbnRoZXNlcyB0eXBlcyBsaWtlIChqb2huIChkZWFuKSkgd2VyZSBub3QgZm91bmQuCgpTbyBJ
IHRoaW5rIGZvciBub3csIHRha2luZyBjYXJlIG9mIHRoZSBjb3JyZWN0IG5hbWUgY29tbWVudCBw
YXJzaW5nCmZvciBxdW90ZWQgbmFtZXMgYW5kIHByb3BlciBjb21tZW50IHBhcnNpbmcgYWZ0ZXIg
dGhlIGVtYWlsIGFkZHJlc3MKc2hvdWxkIGZpeCBtb3N0IG9mIHRoZSBCQURfU0lHTl9PRkYgZmFs
c2UgcG9zaXRpdmVzLgoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCkR3YWlwYXlhbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVs
LW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
