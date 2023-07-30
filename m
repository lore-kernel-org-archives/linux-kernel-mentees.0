Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA78C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 13:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA5660BCC;
	Sun, 30 Jul 2023 13:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA5660BCC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=V/qUzZPl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UzQHSAfTuE4; Sun, 30 Jul 2023 13:19:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4D02260BEC;
	Sun, 30 Jul 2023 13:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D02260BEC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35A2EC0072;
	Sun, 30 Jul 2023 13:19:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D34E7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A34541521
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A34541521
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V/qUzZPl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ed55XiSKDlhm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:19:55 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E412A41505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E412A41505
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so22382195ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690723194; x=1691327994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xe19FSyqVMtSJothuV+9HnDqwn9ZBzV0WLnzrMtLXqI=;
 b=V/qUzZPl2C2fJiVrHo1ek0bN6LOIbGz0QJ2SNo0yUiouo4yAk+SZbOXMvIMbLmOL+Q
 PNyEmwTg+lr+3oW/M2WEwzyb3XVJohKAFYERiXUACMMOevkatBUAtDmDGzgTRlQbXEed
 Kp3b2KOR1aeyyT7WpYmSa/iByeX+NpQ+oAhxxWZp3A7upUn+t4wB9WTtvd6tDrwlibV/
 wS82SrERCEN0prQsTVUaK/solx2On8AiHoIcl1EcXnKY6madqoTeHDX2KfO4ACzUTQWq
 6zqppNtcYDpnaF1qMOlYy7P7fJcMoDID4PHAVUbJuDwDka/KE8uKmjmvP4ewlVfu9cwh
 s74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690723194; x=1691327994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xe19FSyqVMtSJothuV+9HnDqwn9ZBzV0WLnzrMtLXqI=;
 b=cnc1O/tnz/OnsdAGCobY7L6KUHZI5/I3mack+G+U73o0vYx+i/Lp5h8VZjWKCjRTXu
 /du42jb6Hp36TkpKJgP2FW4xEaMJEeUW5K4gUyj4vIzmXnLp7moOwf761P+8AS3+mRlR
 UdPXaGJZz+MHJxzXQj5l4Mplwid9Ft3A1ueE1sIeAUMBy2mxITyPmkPSnlHbMqnofPoM
 Q61DdT45EtsATKkHvjG/zSkEox3fWkXNxC97Jn7uF32Za1u2WIYEZGsXNS2jnLgk6sqP
 iOX8YKhRq4SAw05TOzVEWKDvYpDJM69wfA8/+xn6jDkEWq3kTItN92n3mqMa+82+B27c
 ktyQ==
X-Gm-Message-State: ABy/qLZaMVnk2KjJLF2vgrlST+K/kELWe4fVXmDyH9PW8opPimP/F7aZ
 n8+DEMyiiBn+5rj02wKs51Y=
X-Google-Smtp-Source: APBJJlFhLL4w/TUxkKxMNKA43NH01EhQ9PdJy4NpTiPDx0o9DsuWqs8TzldfKmK5wA/8g3crgaqq8Q==
X-Received: by 2002:a17:902:70c7:b0:1ba:1704:8a12 with SMTP id
 l7-20020a17090270c700b001ba17048a12mr6487132plt.45.1690723194166; 
 Sun, 30 Jul 2023 06:19:54 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b001b03cda6389sm6658317plp.10.2023.07.30.06.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 06:19:53 -0700 (PDT)
Message-ID: <cc5a6736-5fa8-1bae-8649-e113fb32c483@gmail.com>
Date: Sun, 30 Jul 2023 20:19:51 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] samples/bpf: Fix build out of source tree
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>
References: <2ba1c076-f5bf-432f-50c1-72c845403167@gmail.com>
 <CAKH8qBtJ-Nb--BqH+J6K4S++J7J-8uHTPewS3BrVA86GBry=sQ@mail.gmail.com>
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <CAKH8qBtJ-Nb--BqH+J6K4S++J7J-8uHTPewS3BrVA86GBry=sQ@mail.gmail.com>
Cc: daniel <daniel@iogearbox.net>, "martin.lau" <martin.lau@linux.dev>,
 ast <ast@kernel.org>, andrii <andrii@kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

CgpPbiA3LzI4LzIzIDIzOjMwLCBTdGFuaXNsYXYgRm9taWNoZXYgd3JvdGU6Cj4gT24gVGh1LCBK
dWwgMjcsIDIwMjMgYXQgNTo0M+KAr1BNIEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwu
Y29tPiB3cm90ZToKPj4KPj4gVGhpcyBjb21taXQgZml4ZXMgYSBmZXcgY29tcGlsYXRpb24gaXNz
dWVzIHdoZW4gYnVpbGRpbmcgb3V0IG9mIHNvdXJjZQo+PiB0cmVlLiBUaGUgY29tbWFuZCB0aGF0
IEkgdXNlZCB0byBidWlsZCBzYW1wbGVzL2JwZjoKPj4KPj4gZXhwb3J0IEtCVUlMRF9PVVRQVVQ9
L3RtcAo+PiBtYWtlIFY9MSBNPXNhbXBsZXMvYnBmCj4+Cj4+IFRoZSBjb21waWxhdGlvbiBmYWls
ZWQgc2luY2UgaXQgdHJpZWQgdG8gZmluZCB0aGUgaGVhZGVyIGZpbGVzIGluIHRoZQo+PiB3cm9u
ZyBwbGFjZXMgYmV0d2VlbiBvdXRwdXQgZGlyZWN0b3J5IGFuZCBzb3VyY2UgdHJlZSBkaXJlY3Rv
cnkKPiAKPiBJIHdhcyBnb2luZyB0byB0ZXN0IGl0IGxvY2FsbHksIGJ1dCBJIGNhbid0IGFwcGx5
IGl0LiBQYXRjaHdvcmsgYWxzbwo+IGNvbXBsYWlucyBhYm91dCB0aGUgc2FtZSBpc3N1ZToKPiAg
IHN0ZGVycjogJ2Vycm9yOiBjb3JydXB0IHBhdGNoIGF0IGxpbmUgMzMKPiAKPiBBcmUgeW91IGNv
cHktcGFzdGluZyBpdCB0byBnbWFpbCBtYXliZT8gKG9yIG1hbnVhbGx5IGVkaXRlZCBpdCBhZnRl
cgo+IGdpdCBmb3JtYXQtcGF0Y2g/KQo+IE1heWJlIHJlYmFzZSwgYW5kIHJlc2VuZCBwcm9wZXJs
eSB3aXRoIGdpdCBzZW5kLWVtYWlsPwo+IApJdCB3YXMgdGhlIGNvcHkgcGFzdGUgcHJvYmxlbS4g
SSByZWJhc2VkIGFuZCBzZW50IGFnYWluIGJ5IGdpdApzZW5kLWVtYWlsLiBTb3JyeSBmb3IgdGhl
IGluY29udmVuaWVudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVu
dGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
