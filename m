Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC7320383
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Dec 2025 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139362; cv=none; b=Lyy7qae9Ay0ss3NUWkT5OLgCOVrJPyMfmmusGC4hwMzs4UtjLN2ZnWxp+GMoNXyQRa7kHFKeflVRDYpDYDInNZaykJwWLNVgDYsUeiUgmmGfURMdQV0GMvrQTUPV/L7E8zkofyZlM7I8HrNkkjCOEqNQGfDRW6v91To2rNKZWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139362; c=relaxed/simple;
	bh=qidbgDXVZp6ykR2+/5IXt/BtQBS3pxJcPWemvyiEHMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H5WyXrB0H3dy81sAjxmdCImYl9j4AU60uVSiLtC5qYu7US6ZQRyxTS4Ji2PVuwrD/69ectIqpZBYcuSocsB0QsVtK+8i4GMnxqIjFYuRyomJEiPtsAJe1ubBqCqHSfZ8UB4Ksb0pH6YvugASbAljW7/LRwesTp33wyuGhqnq7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzSeKaVZ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzSeKaVZ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2ec756de0so160837285a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Dec 2025 02:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766139359; x=1766744159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycLYVRrePvHyQPkdfYXnS+tZaNi7CZqNfdDOVcOxfeg=;
        b=bzSeKaVZKJ4g+tzvPIyDv5+DNwtaC+Q7j5NWhE+b9cv7KVkGX2sfAmPjzHdX0Fo+gr
         61iSYGH9QAA5p9ty8NGRl0Nngb+aPbSOQifJ5lPofg2nXPZTAi/yNNRsZ1/f4pdps9X5
         H2UVZADKhg31Y9/0pAcPIZQ1KEZkE7O4zmAzzApggO+lODFPXxQKPyWw5A3vsVvkGlqG
         F1ZaozdfqbAe9XpWZvx3TH6rjS4nnUjiaGcx3V/RZziPgAdcGUJ9RvTT7KSQInqRidLc
         hEFtJ3UlymYhmyb99OgVNmivOOQSWlfn0UuBarxDXyDJBylKsehE4ei90cNPENG9KXl5
         POsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766139359; x=1766744159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycLYVRrePvHyQPkdfYXnS+tZaNi7CZqNfdDOVcOxfeg=;
        b=CnZGPE0FIo1LGPi4IEN36yoazQmKoGIIdto6npAE/TQQIRdaOlINtw56RDsFSfd2/x
         IfUr2JZsc7J6kuvxqDsRDoGOEmcvH5HqbUHwGOEyf6ahU1WG1GdwpFwokiifqTJ6LgDM
         oDWmMP/AZgFbaQhq6uTd1RUNVpdakh88b6Tx0V8IROhc6KO+PWoxQsLHHMPt0MRvocJh
         E2SQWIuwFfbCDjZng41CdfOBEmJ4p8aYfzHmoONwG85O+b9NuD0QY9HS3h3pemJLWOB+
         Xi8uC68kFY/jmVZBpeZqNMGL/W2BU59lsf9xV+r0SB5tpXZdMmMoZVVNBEDkTNl55r3/
         bMew==
X-Forwarded-Encrypted: i=1; AJvYcCX3fZV4+vahCK2ct/REBpsZdZDdSZHkwXQHrsTfcumDbSbL9ujqURuDur/c/PB5LUqzsiEwaic4BKyrz+JcAC3h49e/3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi10HPDqa6C61E8FMv5j98jm1Ck8BhP7gTJOSYXZgzHssrQd54
	fov65vZIMvVnS16RoGBmv7QwtuQzbMoYG2UBYoHLZ+Z/BWJIl9wxKmKB
X-Gm-Gg: AY/fxX7rU7jeh5X8W+qk7ogvqkr9KJkTS/ozhlEaJ7IiIJKSQRus1EsBa+A8qLULZUv
	g3oFjW1FN4qFxmRxDwm0quiAi7a7rts7ItjMwdJNH73WMvAT3xBd52nPhOqtN2nKWYpxYvBvAxW
	kfC62CuMyRmkqK6N1vEYFuTQRq3y+NZIn0ZDQyiuza0aHubBnlYP/rJHMly8ni0xC4jJzXv7jBq
	5n/FhNjPxbUq4+deviFquLPDp56VP38+qJQdKBX77VckIom/HQzu1PE5JjVmsMiqpXvGKyoXILU
	U3UjDUzLtGb/qcuRPPXqH+DQuIdfHJWrUvlc6KH9clhC5m33bfhDQsYiJCWsFM52PjkVnvIBiob
	LzHxprAmnLew1rqm20mmnIVejS028k/OGzuO6WKM+FzH0MKomFdho4tbbdcSDCjG8Iw6QZUmrd6
	NIovWdUWRoM52rJvmlh081l6mLSal9yU1CB+1aZG3/BCc5yRW0pfQEYuHaH9NTnP7OvqqHkA==
X-Google-Smtp-Source: AGHT+IFP1l0H8w7uU/D8+kdFU7GHAv1bX+mUdByw7g4p3XknF46ejff2+Hy3IGYyfcaHj80+Rm+ZPw==
X-Received: by 2002:ac8:6f11:0:b0:4f1:aba0:9329 with SMTP id d75a77b69052e-4f4abd15f01mr30950521cf.33.1766139358652;
        Fri, 19 Dec 2025 02:15:58 -0800 (PST)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997ae49esm16761256d6.28.2025.12.19.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:15:58 -0800 (PST)
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
	Aaron Conole <aconole@redhat.com>,
	Adrian Yip <adrian.ytw@gmail.com>
Subject: [PATCH 6.1.y] net: openvswitch: fix middle attribute validation in push_nsh() action
Date: Fri, 19 Dec 2025 04:14:10 -0600
Message-ID: <20251219101411.1970581-1-adrian.ytw@gmail.com>
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
Acked-by: Eelco Chaudron echaudro@redhat.com
Reviewed-by: Aaron Conole <aconole@redhat.com>
Link: https://patch.msgid.link/20251204105334.900379-1-i.maximets@ovn.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 5ace7ef87f059d68b5f50837ef3e8a1a4870c36e)
Signed-off-by: Adrian Yip <adrian.ytw@gmail.com>
---
 net/openvswitch/flow_netlink.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/openvswitch/flow_netlink.c b/net/openvswitch/flow_netlink.c
index d0b6e5872081..d4c8b4aa98b1 100644
--- a/net/openvswitch/flow_netlink.c
+++ b/net/openvswitch/flow_netlink.c
@@ -2786,13 +2786,20 @@ static int validate_and_copy_set_tun(const struct nlattr *attr,
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
@@ -3346,7 +3353,7 @@ static int __ovs_nla_copy_actions(struct net *net, const struct nlattr *attr,
 					return -EINVAL;
 			}
 			mac_proto = MAC_PROTO_NONE;
-			if (!validate_push_nsh(nla_data(a), log))
+			if (!validate_push_nsh(a, log))
 				return -EINVAL;
 			break;
 
-- 
2.52.0

