Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CE0C35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 06:43:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22519206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 06:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="LrtK9lRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22519206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB54920458;
	Sun, 23 Feb 2020 06:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMui2d8s4jHZ; Sun, 23 Feb 2020 06:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 214A12038D;
	Sun, 23 Feb 2020 06:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 001A8C0177;
	Sun, 23 Feb 2020 06:43:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FEAAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 06:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 23EBF2041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 06:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGtotzIpxrj3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 06:43:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F0C52038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 06:43:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g4so239206wro.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2020 22:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NfB/s51uIdoGbaxyHKbys1HDOzUI4Z8k8OTFZnsHy68=;
 b=LrtK9lRKXimo5SPkLaCMf6BvAYihnCZg3cnBk5msBtcWCHZ+Fz4M0YrHrEuLP13ACd
 ePwkIAonq48LxXTdhp6c1G4YdG7j3qIzViNWJRdKdMhxffYQxY62D0FUn8kn0s4I2rS1
 Wtpasd5HAzlS9ZmgiuX1pehA8AAzWq0JCyxGwInkdMwPGsSEuCV0rqLD+KKd+joRFEI8
 TVs9LxwdlvY94SrlOe9NapZcLjMnASsQtyJf4fXiPOXSk7ubzn5MeCwRviV1dYjI/C+y
 KT5jbVrltf5Qn51a0LhgksULgadKblB5nscPBGzQ0Kf0iRv81wK45zQMp6pIP+HplL33
 N05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NfB/s51uIdoGbaxyHKbys1HDOzUI4Z8k8OTFZnsHy68=;
 b=XIvJppnHntAP7Ykh3XkcL5FHXzf65QJeiNbgvdDWSqUkdOdHjc+7SNyFV8mJu7rZlW
 MWHzwkqxirVH6sRGuBvIG9QIN9Md2otLZD48YgKy9yRV5IFLSaYKRQq7e/tWZfFIBIfm
 RKOaiags4PcQK2vKaPPWtjQyTFHAzg7YPOQjy4LLYpvsyvevSY5eXOc/Flxy4fsFjAdf
 Sspp+X9gsc0GCytfZkLfvXG+uW4Q1VNPgEg4qRAtZSfeUAvq9EVXPKj08tIYFRi1y6w9
 qdUBU6h7WSdWiIRkYZA4ZCvRDgVdv6qBLI4T8KDKvVv4U/Xbmchw2xCU6fl0R38pliAa
 F1DA==
X-Gm-Message-State: APjAAAWLbo3X58jbSxQrlJSH6VZQcOLEC7fLWsrypzO/NZPXrur9H8yD
 YhWKPIsCUsjw5SD4pPCcHcMdYg==
X-Google-Smtp-Source: APXvYqx4K2w89yDxHRYUL98MkKUT2TpPQG/iw0IXd+XoIFfw8QT5lhbZ9UHumj/9Hk0t+EVd1UC23A==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr56212773wru.87.1582440211406; 
 Sat, 22 Feb 2020 22:43:31 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id f1sm12197579wro.85.2020.02.22.22.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 22:43:30 -0800 (PST)
Date: Sun, 23 Feb 2020 07:43:29 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200223064329.GD2228@nanopsycho>
References: <20200222065234.8829-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222065234.8829-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Hold
 devlink->lock from the beginning of devlink_dpipe_table_register()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Sat, Feb 22, 2020 at 07:52:34AM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>devlink_dpipe_table_find() should be called under either
>rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
>calls devlink_dpipe_table_find() without holding the lock
>and acquires it later. Therefore hold the devlink->lock
>from the beginning of devlink_dpipe_table_register().
>
>Suggested-by: Jiri Pirko <jiri@mellanox.com>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>---
> net/core/devlink.c | 15 +++++++++++----
> 1 file changed, 11 insertions(+), 4 deletions(-)
>
>diff --git a/net/core/devlink.c b/net/core/devlink.c
>index 3e8c94155d93..ba9dd8cb98c3 100644
>--- a/net/core/devlink.c
>+++ b/net/core/devlink.c
>@@ -6840,22 +6840,29 @@ int devlink_dpipe_table_register(struct devlink *devlink,
> {
> 	struct devlink_dpipe_table *table;
> 
>-	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name))
>+	mutex_lock(&devlink->lock);
>+
>+	if (devlink_dpipe_table_find(&devlink->dpipe_table_list, table_name)) {
>+		mutex_unlock(&devlink->lock);
> 		return -EEXIST;
>+	}
> 
>-	if (WARN_ON(!table_ops->size_get))
>+	if (WARN_ON(!table_ops->size_get)) {
>+		mutex_unlock(&devlink->lock);
> 		return -EINVAL;
>+	}
> 
> 	table = kzalloc(sizeof(*table), GFP_KERNEL);
>-	if (!table)
>+	if (!table) {
>+		mutex_unlock(&devlink->lock);

Please use "goto unlock" instead of unlocking on multiple places.



> 		return -ENOMEM;
>+	}
> 
> 	table->name = table_name;
> 	table->table_ops = table_ops;
> 	table->priv = priv;
> 	table->counter_control_extern = counter_control_extern;
> 
>-	mutex_lock(&devlink->lock);
> 	list_add_tail_rcu(&table->list, &devlink->dpipe_table_list);
> 	mutex_unlock(&devlink->lock);
> 	return 0;
>-- 
>2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
