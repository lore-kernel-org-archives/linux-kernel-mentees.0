Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63362149C6F
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766219597; cv=none; b=WFDNBxwJl7bffU4Xx8UhHgzlOhij6Y0i9JHLquSxQc29k/nu2HnjcUiufKxGjWoHUSyi/qKr0TuUTMA5s9x/xLiGO3zegBTpre4FJTEjbDBRxMRiD8pRvV2aWmoeumcFUDHrNOTF5qaMPwVNkC6oFSV76CW3/n/CC2IDraDOgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766219597; c=relaxed/simple;
	bh=pq/FIErWBVljP69u1kYvr72D2kBq6ZOY2UDhmxvBgT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9IOBedgcuIO9x2ew1EIAMvNufYcspZqwziCXg1ryOe/dCk+M+NzS7uddO8do5NEEKmetlsRO1Vt4SCDihZ7gb4sJ4+Abw6C5TDA7gT+cXv74AIzVQq2CYUeS+sjPtA3rqjdK/YmM3G9GdsHG19vXpw24av79cPavLWhGdkAPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwVLINHJ; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwVLINHJ"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2f2c5ec36so273542685a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 00:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766219594; x=1766824394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEU8uqiI+VIyXCsQ6KDH6Rq3unniQciJU8YDjqznLQs=;
        b=OwVLINHJ0G990r3ysrlLAJMhwwUjyaEO9CdjDvHn/kXrBp8V8p2LzpxsIneZbZGC7l
         XawU+6Dyg88qLJlc65mCsFMp5c58I8jPDVsM84VmbbvACh8Wilt6Z+BTWF00xVNtxyuW
         KA881SZf6TR6Vx0mL2tUeKOnwhzDv9mtsipAdA2lY3qgPQyVE7XzTSiHT9GtqKjmja1I
         3updrhpBOJ7jgFPpEeb1cj9Ls3a9cu85PtCZfsx33WZVD6Ru3FSCCSNKR0QFAVEt50uo
         hBE5zgn1ftEHG9duxiZfkNjD0k4zjrvarhOApLzIYZT8cPFLSEcxKM2DqBK73gzH/M9D
         d25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766219594; x=1766824394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEU8uqiI+VIyXCsQ6KDH6Rq3unniQciJU8YDjqznLQs=;
        b=HNwkPE/q0C2fZndzzqlg7hdrtm1vvTWWgFazaJIk9JA46I3nWqNaXKJ430iS+spIfJ
         6GOZ3KqRGrEWjhgw8YcUkzNFlivOeRoK9QhOk3teVEJO9H83l96M+cuCkk4Y+mwlyvJP
         26uBIMIdy0GHN/CoGOmwlRLd0ihgxQbsSpfG04R8T+B3njlncDMLvO5iIC7e+Cf4ctN6
         LOFuG4Vwn9ReM0JIsjI55GZeVRovgyH9eM2yEyDr/se4JwJM0KzuZUEsAhTvF2zmq6wy
         90W84eNmGmaw+m72RO2bxxzJHJewsY6yxdmjIAFQGkqb7CU+OZlY5u1UgtTyhLDegs5I
         vP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjGekd9dzyEBHqrKrX343Ilq+oHeCbzh/eegvJ+Svi7VPmj2MJwwoUfpcANUo5ymRHmGnSaeSXBj47w3wyx2bA2nvi/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuG5k51r6lf8U+C/DTjduOc9MOG5ZUVXa6+nmzy37WOtlpFW5P
	sgPJnEGD4iPxvgck9g+O4sdB9X77j6QDJjL8WpQc6P1OVFVYFOiCmHdB
X-Gm-Gg: AY/fxX5gaFkop9yiJXzajplFUJGzD559ZcVxQtmkHrsg6bWwDYZwQBs75wJc/WzjC0w
	N2ArMPxsQDMJosW50oaMkok4BCKGbyiF18S/R+w+AQSYBNdCSbBYlj5rhFur0BRZnnHOG0x3Ebq
	UQxUfTn68ioyDkyd5UlEEaK0WP/6F5OsBI4V6EqffDtQVN9nL9GJ+vL8jjOqkqw/Zqpx0oc+X42
	ntv0aj+nAWni1NEnvypvN/vvewA3tDOi4rPZ97duQvuCXyz9MMj3oQjwYgtVS0hXssSX9Z2yt1Q
	ev1HGB4i3v1xgNNO3EF1c873NAgvX7VD/19Ml1YQQRl1+xl4YlA+xwGMm2lL/oAWx9LnLgxeSD4
	2VuklxA5OdJ8A/r5SlAwvGJs8nUU5+Q7UR5G4xMu2r19eY3bkWuY+jKpaYHAYXcfNDrj73zjd1I
	6tDdEBrQYaGOKO/KttcrTVw86aVoTXG5wfgi7+XmrkjxJXQsax5STkPL9m+qs=
X-Google-Smtp-Source: AGHT+IHwTXgZOP1rlGicDDiSypRAJDCxM1E4qVtAuLk27EHrOgjXSd/WSrpzvi/lFsSQEuQsBseoOA==
X-Received: by 2002:a05:620a:2682:b0:8b9:a134:90e0 with SMTP id af79cd13be357-8c08f65843dmr798094485a.16.1766219594105;
        Sat, 20 Dec 2025 00:33:14 -0800 (PST)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623ffe8sm38913786d6.12.2025.12.20.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 00:33:13 -0800 (PST)
From: Adrian Yip <adrian.ytw@gmail.com>
To: stable@vger.kernel.org
Cc: Ilya Maximets <i.maximets@ovn.org>,
	Pravin B Shelar <pshelar@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Junvy Yang <zhuque@tencent.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Aaron Conole <aconole@redhat.com>,
	Adrian Yip <adrian.ytw@gmail.com>
Subject: [PATCH 6.12.y] net: openvswitch: fix middle attribute validation in push_nsh() action
Date: Sat, 20 Dec 2025 02:31:12 -0600
Message-ID: <20251220083119.507027-1-adrian.ytw@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ilya Maximets <i.maximets@ovn.org>

[ Upstream commit 5ace7ef87f059d68b5f50837ef3e8a1a4870c36e ]

The push_nsh() action structure looks like this:

 OVS_ACTION_ATTR_PUSH_NSH(OVS_KEY_ATTR_NSH(OVS_NSH_KEY_ATTR_BASE,...))

The outermost OVS_ACTION_ATTR_PUSH_NSH attribute is OK'ed by the
nla_for_each_nested() inside __ovs_nla_copy_actions().  The innermost
OVS_NSH_KEY_ATTR_BASE/MD1/MD2 are OK'ed by the nla_for_each_nested()
inside nsh_key_put_from_nlattr().  But nothing checks if the attribute
in the middle is OK.  We don't even check that this attribute is the
OVS_KEY_ATTR_NSH.  We just do a double unwrap with a pair of nla_data()
calls - first time directly while calling validate_push_nsh() and the
second time as part of the nla_for_each_nested() macro, which isn't
safe, potentially causing invalid memory access if the size of this
attribute is incorrect.  The failure may not be noticed during
validation due to larger netlink buffer, but cause trouble later during
action execution where the buffer is allocated exactly to the size:

 BUG: KASAN: slab-out-of-bounds in nsh_hdr_from_nlattr+0x1dd/0x6a0 [openvswitch]
 Read of size 184 at addr ffff88816459a634 by task a.out/22624

 CPU: 8 UID: 0 PID: 22624 6.18.0-rc7+ #115 PREEMPT(voluntary)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x51/0x70
  print_address_description.constprop.0+0x2c/0x390
  kasan_report+0xdd/0x110
  kasan_check_range+0x35/0x1b0
  __asan_memcpy+0x20/0x60
  nsh_hdr_from_nlattr+0x1dd/0x6a0 [openvswitch]
  push_nsh+0x82/0x120 [openvswitch]
  do_execute_actions+0x1405/0x2840 [openvswitch]
  ovs_execute_actions+0xd5/0x3b0 [openvswitch]
  ovs_packet_cmd_execute+0x949/0xdb0 [openvswitch]
  genl_family_rcv_msg_doit+0x1d6/0x2b0
  genl_family_rcv_msg+0x336/0x580
  genl_rcv_msg+0x9f/0x130
  netlink_rcv_skb+0x11f/0x370
  genl_rcv+0x24/0x40
  netlink_unicast+0x73e/0xaa0
  netlink_sendmsg+0x744/0xbf0
  __sys_sendto+0x3d6/0x450
  do_syscall_64+0x79/0x2c0
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  </TASK>

Let's add some checks that the attribute is properly sized and it's
the only one attribute inside the action.  Technically, there is no
real reason for OVS_KEY_ATTR_NSH to be there, as we know that we're
pushing an NSH header already, it just creates extra nesting, but
that's how uAPI works today.  So, keeping as it is.

Fixes: b2d0f5d5dc53 ("openvswitch: enable NSH support")
Reported-by: Junvy Yang <zhuque@tencent.com>
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
Acked-by: Eelco Chaudron <echaudro@redhat.com>
Reviewed-by: Aaron Conole <aconole@redhat.com>
Link: https://patch.msgid.link/20251204105334.900379-1-i.maximets@ovn.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 5ace7ef87f059d68b5f50837ef3e8a1a4870c36e)
Signed-off-by: Adrian Yip <adrian.ytw@gmail.com>
---
 net/openvswitch/flow_netlink.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/openvswitch/flow_netlink.c b/net/openvswitch/flow_netlink.c
index e3359e15aa2e..7d5490ea23e1 100644
--- a/net/openvswitch/flow_netlink.c
+++ b/net/openvswitch/flow_netlink.c
@@ -2802,13 +2802,20 @@ static int validate_and_copy_set_tun(const struct nlattr *attr,
 	return err;
 }
 
-static bool validate_push_nsh(const struct nlattr *attr, bool log)
+static bool validate_push_nsh(const struct nlattr *a, bool log)
 {
+	struct nlattr *nsh_key = nla_data(a);
 	struct sw_flow_match match;
 	struct sw_flow_key key;
 
+	/* There must be one and only one NSH header. */
+	if (!nla_ok(nsh_key, nla_len(a)) ||
+	    nla_total_size(nla_len(nsh_key)) != nla_len(a) ||
+	    nla_type(nsh_key) != OVS_KEY_ATTR_NSH)
+		return false;
+
 	ovs_match_init(&match, &key, true, NULL);
-	return !nsh_key_put_from_nlattr(attr, &match, false, true, log);
+	return !nsh_key_put_from_nlattr(nsh_key, &match, false, true, log);
 }
 
 /* Return false if there are any non-masked bits set.
@@ -3388,7 +3395,7 @@ static int __ovs_nla_copy_actions(struct net *net, const struct nlattr *attr,
 					return -EINVAL;
 			}
 			mac_proto = MAC_PROTO_NONE;
-			if (!validate_push_nsh(nla_data(a), log))
+			if (!validate_push_nsh(a, log))
 				return -EINVAL;
 			break;
 
-- 
2.52.0

