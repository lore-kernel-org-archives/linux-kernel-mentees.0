Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C09C71153
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Sep 2023 17:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D75DB81F35;
	Sat,  2 Sep 2023 17:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D75DB81F35
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ovAvysFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdPWuUrEfNpi; Sat,  2 Sep 2023 17:45:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C532E81F34;
	Sat,  2 Sep 2023 17:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C532E81F34
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD38C0039;
	Sat,  2 Sep 2023 17:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8BB2C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABDAB40137
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABDAB40137
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ovAvysFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D95hFjCzpVIy
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:45:32 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBF234002B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF234002B
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68ca2a37c6aso606544b3a.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 02 Sep 2023 10:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693676731; x=1694281531;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+CEe1kQgL3CtWd7NtdDdKsaq4sRrpDW37EyXWEdo+I=;
 b=ovAvysFAgbivcZ3OVIAHWSpozvKMasIwRRRKy3Jlc5KWHirhJDpsydKfy12XwnPj4A
 B3Qdb5miWoga1+yVGsR5VvnkjIvf/VH4+DwDxMgoaFJGtRaTZhZPMhPC+k3PeSlOxbq7
 /EcWTLWj+J7K7c92dni5LhXRYoYW8V4NQhVAAs/y2PDn0CNSoYbRRuHXQD/YjoKlu82q
 7MnLfHQFjrjR2Ijrk4MOxTrLmqt8aF/ijXLXeqpgRWFTzIHFpCrZOAtX/QEd9XHqvH5k
 IVrh5KEGBh800bcykOREsLODAbtF8UTZIw8+SD5TzR/a7e8UAciinwvmGiIErjlPXGgQ
 C58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693676731; x=1694281531;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+CEe1kQgL3CtWd7NtdDdKsaq4sRrpDW37EyXWEdo+I=;
 b=I2OrNCF0SXK2tVzV54RMJU5FqdThYMvoJ0qgxA3aFaUKkcwUTvJlSELo1R443RO1aK
 nAqukec0RtvRgi/gYizenUIG0AnJKLpTC4tkicoOaE5/dKuzXWNeE+TUjhASgHERO6jR
 yyWsnSpp8Jb4Tn+SJIwyVeUaLtNqMK4LYbGP0cwObx4nm79m4Na0TQFiIJIHIE4v1sHl
 IAi5aLOjo6xXzmEuuqERxtHe+zZUbLrsYoPT0J+bu/MvvzvQTwyMMaKrDhmW78UFWtPP
 8vKBVhM5SRTe6p7mLm08mgOQkOJupFfpCZmiIMI2+SiAYDU486D8UddHjrV6WANKkcGl
 1gBw==
X-Gm-Message-State: AOJu0YwV2NlV4iYIdZDtawYT8T9IpS0U28IIHd2ZzdjBt6jfrBqpDdW+
 MsiYE6MM4RD8vahPD40VCaQ=
X-Google-Smtp-Source: AGHT+IHcW13GWHmbrC7g20OUYOCfiODO7gIhf43SwkGdC5kUnbwO3HluVe9PQ4GHWH47f6DSUCa7Rw==
X-Received: by 2002:a05:6a20:2591:b0:14d:6a82:d7ea with SMTP id
 k17-20020a056a20259100b0014d6a82d7eamr7049410pzd.13.1693676730977; 
 Sat, 02 Sep 2023 10:45:30 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.173]) by smtp.gmail.com with ESMTPSA id
 e13-20020a62aa0d000000b006889664aa6csm4817511pff.5.2023.09.02.10.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Sep 2023 10:45:30 -0700 (PDT)
Message-ID: <5dd9b332-49e3-877d-125b-1de5b46af4d5@gmail.com>
Date: Sat, 2 Sep 2023 23:15:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in dbFindLeaf
To: Dave Kleikamp <dave.kleikamp@oracle.com>, shaggy@kernel.org,
 liushixin2@huawei.com
References: <20230829165244.460154-1-ghandatmanas@gmail.com>
 <e62dbf53-9d74-45e5-b44e-53140672b8b5@oracle.com>
 <ae6ce935-96eb-3d40-f252-54fff7eb0ea9@gmail.com>
 <f9475918-2186-49b8-b801-6f0f9e75f4fa@oracle.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <f9475918-2186-49b8-b801-6f0f9e75f4fa@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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

QWN0dWFsbHkgSSB3YXMgdGFsa2luZyBhYm91dCB0aGUgc3RyZWUgYXR0cmlidXRlIG9mIGRtdHJl
ZSB3aGljaCBpcyAKcHJlc2VudCBpbiBib3RoIGRtYXB0cmVlIGFuZCBkbWFwY3RsLgoKTGluayA6
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUuMS9zb3VyY2UvZnMvamZzL2pm
c19kbWFwLmgjTDE2OAoKU2luY2UgaXQgaXMgYW4gYXJyYXkgd2UgY2FuIGFkZCBhIGNoZWNrIGZv
ciB0aGUgc2l6ZSBvZiBhcnJheSBsaWtlIHRoZSAKY29kZSBiZWxvdy4KCgorwqDCoMKgIMKgwqDC
oCDCoMKgwqAgaWYgKHggKyBuID4gKHNpemVvZih0cC0+ZG10X3N0cmVlKS9zaXplb2YoczgpKSkK
K8KgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJldHVybiAtRU5PU1BDOwoKT24gMDEvMDkv
MjMgMjI6MzgsIERhdmUgS2xlaWthbXAgd3JvdGU6Cj4gT24gOC8zMS8yMyAxMDoxOUFNLCBNYW5h
cyBHaGFuZGF0IHdyb3RlOgo+PiBJIHdhcyB3b25kZXJpbmcgaWYgd2UgY291bGQgaW1wbGVtZW50
IGEgZ2V0X3RyZWVfc2l6ZSBtYWNybyB3aGVyZWluwqAgCj4+IHdlIGNvdWxkIGZpbmQgdGhlIHRy
ZWUgc2l6ZSBzbyB0aGF0IHdlIGNhbiBkbyB0aGUgY29tcGFyaXNvbi4gU0luY2UgCj4+IHRoZSB0
cC0+ZG10X3N0cmVlIGlzIGFuIGFycmF5IHdlIGNhbiBnZXQgaXRzIHNpemUgYW5kIGZpeCB0aGUg
b3V0IG9mIAo+PiBib3VuZHMuIFdvdWxkIHRoaXMgdGhpbmcgd29yaz8KPgo+IGRtdHJlZV90IGlz
IGEgdW5pb24gb2YgdHdvIG5lYXJseSBpZGVudGljYWwgc3RydWN0dXJlcyB0aGF0IGJvdGggCj4g
Y29udGFpbiBhbiBzdHJlZS4gVGhlIG9ubHkgcmVhbCBkaWZmZXJlbmNlIGluIHRoZSBzdHJ1Y3R1
cmVzIGlzIHRoZSAKPiBzaXplIG9mIHRoZSBzdHJlZSwgc28gZGJGaW5kTGVhZiBkb2Vzbid0IHJl
YWxseSBrbm93IHdoaWNoIGlzIGJlaW5nIAo+IHVzZWQgYnkgdGhlIGNhbGxlci4KPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVu
dGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1rZXJuZWwtbWVudGVlcwo=
