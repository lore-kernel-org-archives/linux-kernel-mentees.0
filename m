Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBD20B811
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097559; cv=none; b=eTtWEYxXSartUeJXread72DfnF4bhz3mUKEu83YMfoqduGCphfOltEEqPZi2iAVS61pq9VrLPanqaPlmAA6ITgIOWtu9iJFT0hJ5bcni3gU345We9PJ2VivUMHQqCZ/dQEYFYB4l1mASfdt1HKUAeppcqRPsOqWJ62tCbYE5Ldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097559; c=relaxed/simple;
	bh=EwuR0aEZqAZbI/6IsUs5eyGt9WzC2ruGQlQLKWSC90Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SlJcyCTK+5CMqp4gQ+LvSrtOzihXP2SQxXOHG6PyG2AnrMiMCd3dMiIDr8W+6OW3YDVr/q+elnZ5GlP5vF1kuXLZyjg8ySAXW6l6b7aYOSicec+xjV0krtSIK0e0TSR5bAHBg3xN/3aSGB375pYgqS/4X+uzlkMJrjpdK1bZs5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY9oZ+oD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY9oZ+oD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5C85431EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id su9GDYQt9FWV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 20:25:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0B26431ED
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B26431ED
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iY9oZ+oD
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E0B26431ED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 20:25:56 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-723f37dd76cso2738761b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731097555; x=1731702355; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziC/Yq61LN2QkFiWm1kDqgTQsLk/e+GZCQ9Xzo2PVrg=;
        b=iY9oZ+oDn9aLA0zNKf1wzA+HaJ9AvTwrw8xdb0xIpnb/i1w31M0OfR+k9ztpNb9KjI
         8sVL9msS7F0+MWEk1yzbe3bynWLacO191CUo3+ZhmmkjAmLMSnuwePZInzCin1wxEu83
         +Co8fpnj4FnF0YMS7yfI77dzY4nQb2HkqxbwehuynVPBqda9L+VpOTrcwEZ4Fb3zZ/Mc
         7dOHFUBUeeQQF/+7ibRrgcwBbey1INQbnHu/TLlrQAM91bC1VPeNpkXMpg2P8LeXLGic
         sFzwM/RyzHbzoir2ddflr/WtvbPxJh9Lt2TIgfxGFcTsZHl5sUQPyZ4bI8Op/ZQBn0XH
         /Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731097555; x=1731702355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziC/Yq61LN2QkFiWm1kDqgTQsLk/e+GZCQ9Xzo2PVrg=;
        b=mIOMF4xea+24YwDs+DeZ07MtYpmb48ezHNj1brZFUJfqYa8z35uQXW/YEMawVsEmXQ
         V8juYDQeGuin8TzSrUpPa3/m5vz9zh4ck0CGZZ/KGeuOKR0oRJBeXNNNSISH5aSlrDKJ
         1Uo9fnhCxUTB1Hs+IDrHEtbPbuSJaRtc+CAh96lSbb0mQO3SEDawnklmpBnmSy7cbOQ1
         2MeCCCHg6KVpYS6DH864Zlu7Gth11HReFsniM6YoyrHqshSLoY6FqbaMvhFa3fghVCRw
         VHLCLDSZYEqUZqpCr6d5GYQao3xYLQEyn34LmgvGwkGCa3bSwcVcCHJK5JvO4/B63YHG
         Cw4Q==
X-Gm-Message-State: AOJu0YyxFQ+8j/Q/6aLp6d12nxpXwB2LIZ/bkp9uVQvrHotcOlQIyWNp
	10joP6jvfdZ6zLLJIA3Dna52YKVoNMk/w4tKOFVtGCb/e+rEdNQo6DF8uRou
X-Google-Smtp-Source: AGHT+IFzz8Lbq/N+oEHpfPZUIZbcUUGi+YneJibJoBrUZTYSicjrrJP7xbTOlSK+DN7/o1E/TruelQ==
X-Received: by 2002:a05:6a00:3399:b0:71e:7d52:fa8c with SMTP id d2e1a72fcca58-7241338b59fmr5742858b3a.22.1731097554716;
        Fri, 08 Nov 2024 12:25:54 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7ef5sm4342095b3a.63.2024.11.08.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:25:54 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Russell King <linux@armlinux.org.uk>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] docs: net: Fix sfp-phylink whitespace
Date: Fri,  8 Nov 2024 13:25:48 -0700
Message-Id: <20241108202548.140511-2-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108202548.140511-1-xandfury@gmail.com>
References: <20241108202548.140511-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace from sfp-phylink.rst documentation. Trailing
whitespace can cause diff formatting issues and violate kernel coding style
guidelines. This is a trivial cleanup with no content changes.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/networking/sfp-phylink.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
index 5bf285d73e8a..4ce46aef6568 100644
--- a/Documentation/networking/sfp-phylink.rst
+++ b/Documentation/networking/sfp-phylink.rst
@@ -142,7 +142,7 @@ this documentation.
 						  const struct ethtool_link_ksettings *cmd)
 	{
 		struct foo_priv *priv = netdev_priv(dev);
-	
+
 		return phylink_ethtool_ksettings_set(priv->phylink, cmd);
 	}
 
@@ -150,7 +150,7 @@ this documentation.
 						  struct ethtool_link_ksettings *cmd)
 	{
 		struct foo_priv *priv = netdev_priv(dev);
-	
+
 		return phylink_ethtool_ksettings_get(priv->phylink, cmd);
 	}
 
-- 
2.34.1

