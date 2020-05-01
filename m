Return-Path: <SRS0=To0o=6P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0BEC47253
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 18:01:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006B220787
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 May 2020 18:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="UyKhDJCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006B220787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9371B2044C;
	Fri,  1 May 2020 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcwsP7GP0Mgd; Fri,  1 May 2020 18:01:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 563E720130;
	Fri,  1 May 2020 18:01:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3936DC0864;
	Fri,  1 May 2020 18:01:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05ADEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EBEA388316
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 18:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVzAPJHK19wm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 18:01:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D30118830E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 May 2020 18:01:29 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x12so8514827qts.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=R/ny5O23qHZ/6HkUk8R42xO9t9Z/odrSx48FpK+9LL0=;
 b=UyKhDJCNhpg279EF+x0IcoGL83mhEvtBeR28i/INiWPxYDrkrs0xN2ap09ggyf6Mlt
 UJn7Bfq+DrVXgTlD8IDmmVVXg6rAZmVHArcWSpfMv3pTvUE2/ieFGb/Cf7FBhAEsTTE4
 nXqG6A/tPNVUYmh8tz0/9eg1kXiNe1/tNv/cOIDwVlu0kbuJwKkAK7giJt6+pwt0lVRO
 3/hcBaAigNrJ4vsP8oxubpvYc0otgP7OyQ/YRBWXKHxkRCVYzypRp3pMZzXo0KIuJHdA
 M154B13SHlfNKfmNq8Uru0hVUoDbFuhu+mI+JZal/TophSjUsICpyEj2SEbRFVtw+rdN
 gF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=R/ny5O23qHZ/6HkUk8R42xO9t9Z/odrSx48FpK+9LL0=;
 b=KgsTOxfiPo0uImOmngLKy/fCN/ekegUTGjzF9qQxjAbSloGy4WY+5lVXb4vAq5t7EL
 JhrofqNKwkZay9Gooh7E1mf+6f2KJ+i7TfBUj+5yptMXDK5KST6517XFWLMEbsWlevlW
 6/eIXVUbqtqBlW1FqEsjtZ/r6BrVKGVzTw9nLDPTqeCQXrkDQ3htaDZ7VGJVzqfe4VBQ
 EpiQ9DvsBoBX8rZfMCfI1s3NRRLmYKBzRo75gSS8eF+oTqEdm1a9rc1/TDP9UZ3zp2Sw
 Ww1aR6KnELQNKuE2BL7GKn+1wKAP+UsmrCjl1JQmI8nOlScWvDbpQ79+g7VigQ+QmLHb
 uz0A==
X-Gm-Message-State: AGi0PuYB39qP23rXibsGSYlrnbNMqEpVNrz1EoT0/kQCR8DWyG/D03Fy
 g2Y/8mh/CqDO56hS1sxkOAR+aZiK72Q+Mg==
X-Google-Smtp-Source: APiQypJlxpAqdX3I8tFWXFOkpIKB7qhyPDokZ54vQisfC1xyg0MQCyJa4+xK/qzJm9bpgcqGeQnU2Q==
X-Received: by 2002:ac8:33fd:: with SMTP id d58mr4599712qtb.213.1588356088401; 
 Fri, 01 May 2020 11:01:28 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id k127sm3081114qkb.35.2020.05.01.11.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 11:01:28 -0700 (PDT)
Message-ID: <0d669c930e4a7c8e91ce85504541a4522bf63770.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Date: Fri, 01 May 2020 15:01:24 -0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [Linux-kernel-mentees] [Bug Report] tools/testing/kunit/kunit.py
 run --build_dir='<foo>' fails on "unclean" trees
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

SGksCgoxLiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNTIx
OQoKQXQgZmlyc3QgSSB0aG91Z2h0IHRoaXMgYnVnIHdhcyBpbiBLVW5pdCwgSSBjaGFuZ2VkIHRo
ZSBLVW5pdCBjb2RlIHRvCmNoYW5nZSB0aGUgQVJDSCBlbnZpcm9ubWVudCB2YXJpYWJsZSBpbnNp
ZGUgcHl0aG9uLCBhcyBJIGhhZCB0cmllZCB0bwpyZXByb2R1Y2UgdGhlIGJ1ZyB1c2luZyBhbm90
aGVyIGFyY2hpdGVjdHVyZSwgaW4gbXkgY2FzZSDigJxhcm02NOKAnSwKaW5zdGVhZCBvZiDigJx1
beKAnSwgYW5kIHRoZSB3YXkgSSByZXByb2R1Y2VkIHRoZSBidWcsIG15IHBhdGNoIGZpeGVkIHRo
ZQpidWcuCgpBZnRlciBCcmVuZGFuIHJldmlld2VkIG15IHBhdGNoIGFuZCByZXBvcnRlZCB0aGF0
IHRoZSBidWcgc3RpbGwgZXhpc3RzCmFuZCBleHBsYWluZWQgdGhlIHN0ZXAgYnkgc3RlcCB0byBy
ZXByb2R1Y2UgdGhlIGJ1ZywgSSB3YXMgYWJsZSB0bwpyZXByb2R1Y2UgdGhlIGJ1ZyBldmVuIHdp
dGggbXkgcGF0Y2g6CgokIG1ha2UgQVJDSD11bSBkZWZjb25maWcgJiYgbWFrZSBBUkNIPXVtIC1q
OAogIFtzbmlwXQokIG1ha2UgQVJDSD11bSBtcnByb3BlcgogIFtzbmlwXQokIG1ha2UgQVJDSD11
bSBkZWZjb25maWcgTz0uL2J1aWxkX3VtICYmIG1ha2UgQVJDSD11bSAtajggTz0uL2J1aWxkX3Vt
CiAgW3NuaXBdCiAgQ0MgICAgICBzY3JpcHRzL21vZC9lbXB0eS5vCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3R5cGVzLmg6NiwKICAgICAgICAgICAgICAgICBmcm9tIC4u
L2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxlLmg6MTIsCiAgICAgICAgICAgICAgICAgZnJv
bSAuLi9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmM6MzoKLi4vaW5jbHVkZS91YXBp
L2xpbnV4L3R5cGVzLmg6NToxMDogZmF0YWwgZXJyb3I6IGFzbS90eXBlcy5oOiBObyBzdWNoCmZp
bGUgb3IgZGlyZWN0b3J5CiAgICA1IHwgI2luY2x1ZGUgPGFzbS90eXBlcy5oPgogICAgICB8ICAg
ICAgICAgIF5+fn5+fn5+fn5+fn4KY29tcGlsYXRpb24gdGVybWluYXRlZC4KbWFrZVsyXTogKioq
IFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjEwMDogc2NyaXB0cy9tb2QvZGV2aWNldGFibGUt
Cm9mZnNldHMuc10gRXJyb3IgMQptYWtlWzJdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgptYWtlWzFdOiAqKiogWy9ob21lL2loYS9zZGIvb3BlbnNvdXJjZS9sa21wL2xpbnV4
LQprc2VsZnRlc3QuZ2l0L01ha2VmaWxlOjExNDA6IHByZXBhcmUwXSBFcnJvciAyCm1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9paGEvc2RiL29wZW5zb3VyY2UvbGttcC9saW51eC0K
a3NlbGZ0ZXN0LmdpdC9idWlsZF91bScKbWFrZTogKioqIFtNYWtlZmlsZToxODA6IHN1Yi1tYWtl
XSBFcnJvciAyCiAgClRoZSBjYXVzZSBvZiB0aGUgZXJyb3Igd2FzIGJlY2F1c2UgYXJjaC8kKFNV
QkFSQ0gpL2luY2x1ZGUvZ2VuZXJhdGVkCmZpbGVzIHdlcmVuJ3QgcHJvcGVybHkgY2xlYW5lZCBi
eSBgbWFrZSBBUkNIPXVtIG1ycHJvcGVyYC4KVGhlbiwgYW5hbHl6aW5nIHRoZSBNYWtlZmlsZSwg
YW5kIHJlcHJvZHVjaW5nIHRoZSBidWcsIEkgbm90aWNlZCB0aGF0IGEKZGlyZWN0b3J5IHdhcyBu
b3QgY2xlYW5lZCBieSBtcnByb3Blci4gSSBoYWQgYSBodW5jaCB0aGF0IHRoaXMgYnVnCmRpZG4n
dCBleGlzdCBiZWZvcmUgYW5kIEkgY29tbWVudGVkIHRvIEJyZW5kYW4gYWJvdXQgcnVubmluZyBn
aXQKYmlzZWN0LiBBbmQgaW4gZmFjdCB0aGUgYnVnIHdhcyBpbnRyb2R1Y2VkIGluIHRoZSBrZXJu
ZWwsIGFzIHZlcmlmaWVkCnRocm91Z2ggZ2l0IGJpc2VjdC4gQW5kIHRocm91Z2ggdGhlIGNvbW1p
dCBJIHNhdyB3aGVyZSBJIHNob3VsZCBmaXggdGhlCmJ1Zy4KCkluIHRoZSBwcm9jZXNzLCBJIHJl
YWxpemVkIHRoYXQgSSBjb3VsZCBoYXZlIG1vcmUgcXVpY2tseSBpZGVudGlmaWVkCmZpbGVzIG5v
dCBkZWxldGVkIGJ5IG1ycHJvcGVyIGp1c3QgdXNpbmcgZ2l0IGNsZWFuIC1pZHguCgpUaGUgZmly
c3Qgc29sdXRpb24gd2FzIHRvIHJlbW92ZSB0aGUgZGlyZWN0b3J5IG5vdCBjbGVhbmVkIGJ5IG1y
cHJvcGVyCmluIHRoZSBtYWluIE1ha2VmaWxlLiBCdXQgTWFzYWhpcm8gWWFtYWRhLCBpbiB0aGUg
Y29kZSByZXZpZXcgbm90ZWQKdGhhdCB0aGUgcHJvYmxlbSBzaG91bGQgYmUgZml4ZWQgb25seSBp
biBhcmNoaXRlY3R1cmUg4oCcdW3igJ0sIGl0IHNob3VsZApiZSBzb2x2ZWQgd2l0aGluIHRoZSBN
YWtlZmlsZSBvZiDigJx1beKAnSBhbmQgc3VnZ2VzdGVkIGFub3RoZXIgc29sdXRpb24KdXNpbmcg
TVJQUk9QRVJfRElSUyArPSBhcmNoLyQoU1VCQVJDSCkvaW5jbHVkZS9nZW5lcmF0ZWQgaW4gdGhl
Ck1ha2VmaWxlIG9mIOKAnHVt4oCdLgoKQW5kIHdpdGggdGhhdCBteSBwYXRjaCB3YXMgYWNjZXB0
ZWQ6Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzQvMjEvMTMzNgoKCkJSLApWaXRvcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVs
LW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
