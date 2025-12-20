Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EC2FFDD6
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766222422; cv=none; b=XmAIf+99kW9/wZ5DGdvf7jLN4Mh3IDJ2vi3E97zxoDSNfFGZaOZbu/yU5HBw111GkfULyPI4HziCNubf5RqFDd6J69E7beeuSaJmYB9g9ZC6vbwtjOws3M5rBGflaSy5M1Jxjv8I7ZiZvTvZq50iDxjLR1J6VWg3np6XVF6nAtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766222422; c=relaxed/simple;
	bh=Daaz4o2vbQEuaBUAI80RqVDPPgdoj+8ZAOZ5YUluhgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0PqEaU2B8XRyjiKmcfVMFw51A9MsHiL4n65g1av2uNiy6bgrtnrzRcbu+2QfOC5pKg1sgCIEeodEdJZweerMnql9qo17KPvXeUpHYfGcbE7eg1W/l6n37cnsr76qHrbSCs/UoKArJKlTbRGldRcLAtSIWbu+GhrGIp+/oINP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLR7SjyQ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLR7SjyQ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed82ee9e57so31458961cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Dec 2025 01:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766222420; x=1766827220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNisCTFh/jvdeWyigS/01un+TGTuRdNBQti/UMEC4vk=;
        b=aLR7SjyQWJTIWUWwt9czDOVl+VaZ2KJIkdQbgxuAsu/d7o6D28DyZsN5Vlx7sr30Kw
         4h/LevlhmtlbAuuy6eVl2j5BOS2NK1DO38togZk6Oc3M7qDhO9I50PbuZZv/Pqp/KX3J
         NdWb5VKhp4fxlyR0UoUBHgjBoFozJReGQ230/M2HM/ondhpnxTJ1C4+nqqbYED3cZ1gV
         7cEl1lz5KIh8omjBx9PGrWKNDHN3mYsohs6kF3DOQuOiGDXqwA9ZVfzhhCuGj6gPmJpG
         yNLE0IftpWatb1vd22ySmFLEknCPHog/FfmwAsEtc65yHprI3e2n/5lMb1/AboTVYLc3
         wR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766222420; x=1766827220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNisCTFh/jvdeWyigS/01un+TGTuRdNBQti/UMEC4vk=;
        b=KYBXyhEXwTV2o/buoagz0DeJzkxSk1li5W0HtJMWLuSZIpD0jC+o/F6GFt4uwtjwWo
         EEnAa4SMuXajGmIQz/FNfqoDPGViskrYmpqadoWyvMfxXkJFNPgJNEs8xTPO7+aQ3Hql
         GlMA9neIjepq8X39EgbM1So784M7XgLTLWUXZelLQjiyk1rExcDueh5FAN7zhQkyoBcT
         5pQ1aDBfHbGZxbd7E3KsmD7i0aTAO1qutlCsIzYHpz1fX2T+eRd9ooaNshxaG/l+wFzY
         2jqLLfNam7Xv/ZgnEHHyWkPz0WF6M7U1Pwzh+UNFsKxk8Z2uZw9E+DPQk4p03dHHPxS0
         YU0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOEU3Q8fe5lJ2LvASjDYhm1sEQ9eq/M97kMyCnA5+f6BJW7HVB3W1E9zuVXKKmACpNUmLY6JlnjuN+vx8M+h3G1YKvBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaeRycMDtGMCmrZOtdUVnBoIbXk+Zxn5MFdlzLIsZC0En74ES8
	SKxyO9P7lSlIwNKYgn8n73Q3+ykAKLRnFCh+uv3TNzmWcYhOMRXOHm8r
X-Gm-Gg: AY/fxX7zy6AvHA41WBpVkibk0d/igkN1SnS0OVE79ZD+m5d8y59n4loHm2X5z2YcatL
	1pgSlQ89lPhTd4/sIvbRaNQmwbuN9u+AMVN7WU770gXTRYH911psRqSZXXZuYCKI0nJM1/Pz35U
	xS+NQJ55eyyRjKUNp8bQ4xX/TM7U1WhW0tv+slqhqEWiYurvh3d2J4qPiiol9tt3U4Btdf1XlOG
	MDaNNu48H0fPzBHYeY2t7xjh7DgDB9VJ+mOorPQ5dnnvDXJPj0FVzfYYOVOBuFHVxa9SJ5Ejc49
	NyYCSXpq8xgo0igyV7O9P5Zo1vUwfdw4jFfVCHpRWq4mnDESpjp7X5aW3RExsc92iRgEfgsaot9
	2inKusQndhw+5D27p/v/hRM/Q49/cFuvPHjcu7m08Jnq5qq11hY3eA21uijCdZoqmnqWEuYiZce
	B2UZStHqmGAce64KPT2SOUTcAs3lJS3pPSvBl/cgYwdwmubvq8Kx4VX3FuJdA=
X-Google-Smtp-Source: AGHT+IH4H4ZkvasR68lLmuX0dZ89HpmVFzvwt19Y2Ioa5zSggk5Vy5oNmMJVbQfs+uP7Jh5uMApNzQ==
X-Received: by 2002:ac8:5d8a:0:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-4f4abd80e8dmr83852041cf.38.1766222420211;
        Sat, 20 Dec 2025 01:20:20 -0800 (PST)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d973ad605sm36305876d6.23.2025.12.20.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:20:19 -0800 (PST)
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
Subject: [PATCH 6.17.y] net: openvswitch: fix middle attribute validation in push_nsh() action
Date: Sat, 20 Dec 2025 03:18:17 -0600
Message-ID: <20251220091818.562528-1-adrian.ytw@gmail.com>
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
index 1cb4f97335d8..2d536901309e 100644
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
@@ -3389,7 +3396,7 @@ static int __ovs_nla_copy_actions(struct net *net, const struct nlattr *attr,
 					return -EINVAL;
 			}
 			mac_proto = MAC_PROTO_NONE;
-			if (!validate_push_nsh(nla_data(a), log))
+			if (!validate_push_nsh(a, log))
 				return -EINVAL;
 			break;
 
-- 
2.52.0

