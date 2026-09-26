Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD504A1DF3
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790455525; cv=none; b=WkUumqizkk6lvxwXSFwLATvnTuCVMN1dNPGpXYf8V9BE+zYhD+vL+YNQyqypOrPkdHi2tDctlXe/xBRfeBYu305wvouomaOGFB+DKABH6ipC2t4jhoUE8upa0IpeQ8jBaZJvnhIY53GIo9rkUXUuSH9luKXOaDFXFIa0ofV3V9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790455525; c=relaxed/simple;
	bh=MqlDK8J55jruNGAuPsjgh2PCNLlgAIqAbN5WMHFdtr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JBS8bPF8m11zranvJZoJD+HfYs4K2FBUKfbEMNTChm7aOTAWjoUG64nmFZIGi310Cs5KuAEfJQlPMCCIe28WXXWoP+XM+8SywugBUSKa/YeE1eXaoMoRf7yUnQc7D8YcVFkI1Lh2QDo479dzYBGIGgrgkpg2VDPH2Evm9kTjezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty/zRBSw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty/zRBSw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1569807f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790455522; x=1791060322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLi/sbHjZerOh2XvyIRDVA+fsCYAAIaxVQV+uCdFySc=;
        b=Ty/zRBSwU55V8nalGwQZj+8d59+zp0fMjh/l9eqG6D7aqa6o4SYiNsLpyf8Y+F2TvX
         cFyh3xMAHjQeufCrBSmdUum0vkUy4mo9fQ0fotHz8PhnKQqR1uQEcPHYTVJmcMo2Jhni
         ohKQIxmAHaMCQUyFvll96sL/u5J8NuW49RSMqe4VDPCvES73mOIaMMaicehQyz2QMUrI
         eh0sEaZ+QJdVv/342wf09rsH/0gPDIqhoKNwhHe8B+m8PaZ0kMCxm+HqldcLd+WIjN3K
         4wfIkwBDLoahRqPv2K2LctNvWAWFe58KPEjDUjhzfaJ2qKptfL3tDYJw6F4eyOgDeh45
         XrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790455522; x=1791060322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLi/sbHjZerOh2XvyIRDVA+fsCYAAIaxVQV+uCdFySc=;
        b=vw/VPb36TjqIVhaU/NrFcaFIhxII3cQCyQoTjMWfp2NZrB+D0ckb/oEhSMEcla6bL3
         MzbT9nh0v1WAWTxqobmVwQf2/CUoZVFNLauvlpcGPOus7X75mkEmrs5E0RqO17BAJO7p
         iHIK4t4AHsUJp8MpCn2Et9ADa4PsM+rblDktg8TjVZV6rlcEv825vt0HFuqSiCvnRd4K
         lDHD/8UtovQfZDOozeko/DPm873nksaHUkOWaMjtIOvbmg08Pje9dLN/pgrbYhwltV2N
         iNZs/+fG4jrIkkGA7bq49qVjVTxoftoxNsBGOcGSISylAsQzaETrpfCqo0NOL/md9qsM
         7Qhw==
X-Forwarded-Encrypted: i=1; AKwUvBwvxodAZk2Fpol2XkwEcfyjpdE7pdrKE216sVUeLid8cLalGghNbsK3K07O4U92oksVI1+6Un+h0bk/PLpfCsqhhtRB7A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJGH+DiIkXFPyO86aQTTWk98lYMEnFtFBhtjuDAFwuCd550QDma
	wmaP1oQSp3GIQY+eJ958+h9SX3SeRVJ0iKdJPR91d/sZZIUzU8wUZnjy
X-Gm-Gg: AYBFou142Z778EJ9ZXAjj+Cki01vEzJ3hrl7cnzjpyjwudE3ItZWsYhttpttArredV7
	kR7d2b0p4dTZXOmFJYBwkDTvWaTgz21719NsXtwSbk1PthYyG2BSqQm0OCi6ceGRj/Rod6FUL+2
	hZsT3KJRPqxL1wR5crIx5+7GPc9RrH7PwcTqrrQRM0v2Y345YCi29f4n7xEBdK//VvXNbXIcCtK
	rSytw81dK3m/8LvXuTWPqJAsflWy7sRF8jfVu9XA6Hzrzj/bFceaIjuyYrgpSolzA+FIXeezvRZ
	0TUPjR7T14pfPa1Sxt54OKNJIDutL8Qn9/PzcPpKxIwlle3XY3ZF2vguHYSmfKxPJR3gEDcFfHv
	DHRpDtzasif//70z54RCjPBUKBTjccsouEsYlB0lFLMlvqMTcX8C9U8cc8nA1PguD6qXeGUa/ia
	esk/oc22Tb8co8UJ5ecEaXZ2POUh6UZt51Ga9UGS1Ry4qaorfrbBYyZfSV1nBbCT59N+zawcREv
	eLXvc4YXjlQ2DNbr3POZ1ko+xMCmj0VFsLLLfEUR6hCovjgMXV0LfVJVuHXcNsvEYc=
X-Received: by 2002:a05:6000:644:b0:488:7d0b:e354 with SMTP id ffacd0b85a97d-4887d0be4cfmr9257525f8f.45.1790455522177;
        Sat, 26 Sep 2026 13:45:22 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm16394881f8f.18.2026.09.26.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:45:21 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Patrick McHardy <kaber@trash.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com,
	Phil Sutter <phil@nwl.cc>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org
Subject: [PATCH nf] netfilter: ip6t_SYNPROXY: check TCP header before verifying checksum
Date: Sat, 26 Sep 2026 21:45:18 +0100
Message-Id: <20260926204519.43402-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synproxy_tg6() passes par->thoff to nf_ip6_checksum() before it has
checked that a TCP header is actually present at that offset.

par->thoff comes from ipv6_find_hdr(), called by ip6_packet_match()
with target -1. ipv6_find_hdr() only checks that each extension header's
first two bytes are in the skb. It then adds that header's declared
length to the offset and stops at the first non-extension header, so it
can return an offset past the end of the packet. With
CHECKSUM_NONE, nf_ip6_checksum() calls skb_checksum(skb, 0, thoff, 0).
When thoff is larger than skb->len, the BUG_ON(len) in skb_checksum()
fires:

  kernel BUG at net/core/skbuff.c:3606!
  RIP: 0010:skb_checksum+0x8b2/0x8c0
  Call Trace:
   nf_ip6_checksum+0x1bd/0x320 net/netfilter/utils.c:89
   synproxy_tg6+0x1a4/0x6e0 net/ipv6/netfilter/ip6t_SYNPROXY.c:21
   ip6t_do_table+0xd37/0x15b0 net/ipv6/netfilter/ip6_tables.c:366
   ...

In the syzbot reproducer, a 60-byte packet carries an AH header, then two
hop-by-hop headers. The last hop-by-hop header has nexthdr TCP and
hdrlen 167, so thoff is 1400.

Fetch the TCP header with skb_header_pointer() first, as
nf_reject_ip6_tcphdr_get() already does. This drops packets that do not
contain a full TCP header at thoff before the checksum is computed.

Fixes: 4ad362282cb4 ("netfilter: add IPv6 SYNPROXY target")
Reported-by: syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5a8667f002726fc59f88
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 net/ipv6/netfilter/ip6t_SYNPROXY.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/netfilter/ip6t_SYNPROXY.c b/net/ipv6/netfilter/ip6t_SYNPROXY.c
index d51d0c3e5fe9..04db1f82420b 100644
--- a/net/ipv6/netfilter/ip6t_SYNPROXY.c
+++ b/net/ipv6/netfilter/ip6t_SYNPROXY.c
@@ -18,13 +18,16 @@ synproxy_tg6(struct sk_buff *skb, const struct xt_action_param *par)
 	struct synproxy_options opts = {};
 	struct tcphdr *th, _th;
 
-	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
-		return NF_DROP;
-
+	/* par->thoff may point past the end of the packet; make sure a
+	 * full TCP header is present before checksumming up to it.
+	 */
 	th = skb_header_pointer(skb, par->thoff, sizeof(_th), &_th);
 	if (th == NULL)
 		return NF_DROP;
 
+	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
+		return NF_DROP;
+
 	if (!synproxy_parse_options(skb, par->thoff, th, &opts))
 		return NF_DROP;
 
-- 
2.34.1

