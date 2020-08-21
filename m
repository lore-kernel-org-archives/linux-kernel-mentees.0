Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12B8C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 03:08:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF6BF207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 03:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNPUrNxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF6BF207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9341522E6E;
	Fri, 21 Aug 2020 03:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQjOXy1+QHix; Fri, 21 Aug 2020 03:08:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C393222D0D;
	Fri, 21 Aug 2020 03:08:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF410C0889;
	Fri, 21 Aug 2020 03:08:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E961C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 174E48654C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQCAOmbr5gTi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E73A3867C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 03:08:36 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b11so243277pld.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QovNeBLcz/7U1y28iI074IyoegagSi9Pk7ZasyQM9Xw=;
 b=lNPUrNxNIaN3d3qmYG+uNNh2/bZ3UBB//1VGnslfwd0JVUdirtZRbkGgbX/XPYjp26
 V0l2dZNTpmS1pbrUtkcYZtoHPYwp3vLzRclaeAj7BE2MTdGAT6rOvfjZFSQOpiw06Xb1
 i51Lw90UQtUYgTCPDgnglSmFkGhfYQQJ91ZTYGfcZKmLZh8nNFyq9mT123e+xahr5ltO
 XvsC5FXg6KZeWtrvDOILcbMF5HlM9RphG8jBRzV2iA7CZqH9jH/cYf8c8++pewsJ8Z9O
 Qo7kjxC32v1ccbz9gg6gw19Ljx6uPo8jvprZxovKlh2E7g1iZhQysjxgWPlAdeC9oNPU
 cp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QovNeBLcz/7U1y28iI074IyoegagSi9Pk7ZasyQM9Xw=;
 b=iSf+LJc8gD3bRBTROGtK0Ld+45X0f+dbXil/OkRu0woe5bgVrwv8GsSloGGqNXwfQh
 B5ZeW7s9r9u2I2bI2o0336bI72yVSRtAH2fn0/NLUt3kKaq9JYZmhsHH3ykLuzXLc1S9
 hpevLBIAnd7rVt4csh3EHWRtjMunKIaC53zTiJ/vB2UF/WvvXe14DUpKaGdYT0drKQeT
 IjTV2Csn/EBZvgJIm56C1vTwHtfnL+zG8ldfxQz7fu7YCEwrwrmPav787Tb4/AckGQzC
 R7LtOtDbliUUPrkuQrHRprBV9I7K9EK5HsMM8UCIhWJqYUtbA/3l1cIr7i1J+tpNVrFX
 ZrpQ==
X-Gm-Message-State: AOAM530t8Q7yPFx1ChVRpJSc/7RMkmYLCIzhVwPNfXzaNh5Cz8vkmX6F
 g8PvXP+INSm0S+WulCEtHLM=
X-Google-Smtp-Source: ABdhPJzs3ZCyONm3LzrL803MO8Uuq2kCoUY+mP5bs4am5Kpt5047p7K/IWc6qR7/kFRpWt6rDJe/qA==
X-Received: by 2002:a17:902:bd85:: with SMTP id q5mr666244pls.99.1597979316397; 
 Thu, 20 Aug 2020 20:08:36 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id q82sm564189pfc.139.2020.08.20.20.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:08:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 21 Aug 2020 11:08:22 +0800
To: Benjamin Poirier <benjamin.poirier@gmail.com>
Message-ID: <20200821030822.huyuxa5o5tcvtv2o@Rk>
References: <20200814160601.901682-1-coiby.xu@gmail.com>
 <20200814160601.901682-2-coiby.xu@gmail.com>
 <20200816025640.GA27529@f3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816025640.GA27529@f3>
Cc: Michal Kubecek <mkubecek@suse.cz>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC 1/3] Initialize devlink health dump
 framework for the dlge driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Aug 16, 2020 at 11:56:40AM +0900, Benjamin Poirier wrote:
>On 2020-08-15 00:05 +0800, Coiby Xu wrote:
>> Initialize devlink health dump framework for the dlge driver so the
>> coredump could be done via devlink.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/staging/qlge/Makefile      |  2 +-
>>  drivers/staging/qlge/qlge.h        |  9 +++++++
>>  drivers/staging/qlge/qlge_health.c | 43 ++++++++++++++++++++++++++++++
>>  drivers/staging/qlge/qlge_health.h |  2 ++
>>  drivers/staging/qlge/qlge_main.c   | 21 +++++++++++++++
>>  5 files changed, 76 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/staging/qlge/qlge_health.c
>>  create mode 100644 drivers/staging/qlge/qlge_health.h
>>
>> diff --git a/drivers/staging/qlge/Makefile b/drivers/staging/qlge/Makefile
>> index 1dc2568e820c..0a1e4c8dd546 100644
>> --- a/drivers/staging/qlge/Makefile
>> +++ b/drivers/staging/qlge/Makefile
>> @@ -5,4 +5,4 @@
>>
>>  obj-$(CONFIG_QLGE) += qlge.o
>>
>> -qlge-objs := qlge_main.o qlge_dbg.o qlge_mpi.o qlge_ethtool.o
>> +qlge-objs := qlge_main.o qlge_dbg.o qlge_mpi.o qlge_ethtool.o qlge_health.o
>> diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
>> index fc8c5ca8935d..055ded6dab60 100644
>> --- a/drivers/staging/qlge/qlge.h
>> +++ b/drivers/staging/qlge/qlge.h
>> @@ -2061,6 +2061,14 @@ struct nic_operations {
>>  	int (*port_initialize) (struct ql_adapter *);
>>  };
>>
>
>This patch doesn't apply over the latest staging tree. I think your tree
>is missing commit d923bb6bf508 ("staging: qlge: qlge.h: Function
>definition arguments should have names.")

Thank you for applying the patch to test it! I had incorrect
understanding about the word "RFC" and didn't do a rebase onto
the latest staging tree.

>
>> +
>> +
>> +struct qlge_devlink {
>> +        struct ql_adapter *qdev;
>> +        struct net_device *ndev;
>
>I don't have experience implementing devlink callbacks but looking at
>some other devlink users (mlx4, ionic, ice), all of them use devlink
>priv space for their main private structure. That would be struct
>ql_adapter in this case. Is there a good reason to stray from that
>pattern?
>
>> +        struct devlink_health_reporter *reporter;
>> +};
>> +
>>  /*
>>   * The main Adapter structure definition.
>>   * This structure has all fields relevant to the hardware.
>> @@ -2078,6 +2086,7 @@ struct ql_adapter {
>>  	struct pci_dev *pdev;
>>  	struct net_device *ndev;	/* Parent NET device */
>>
>> +	struct qlge_devlink *devlink;
>>  	/* Hardware information */
>>  	u32 chip_rev_id;
>>  	u32 fw_rev_id;
>> diff --git a/drivers/staging/qlge/qlge_health.c b/drivers/staging/qlge/qlge_health.c
>> new file mode 100644
>> index 000000000000..292f6b1827e1
>> --- /dev/null
>> +++ b/drivers/staging/qlge/qlge_health.c
>> @@ -0,0 +1,43 @@
>> +#include "qlge.h"
>> +#include "qlge_health.h"
>> +
>> +static int
>> +qlge_reporter_coredump(struct devlink_health_reporter *reporter,
>> +			struct devlink_fmsg *fmsg, void *priv_ctx,
>> +			struct netlink_ext_ack *extack)
>> +{
>> +	return 0;
>> +}
>> +
>> +static const struct devlink_health_reporter_ops qlge_reporter_ops = {
>> +		.name = "dummy",
>> +		.dump = qlge_reporter_coredump,
>> +};
>
>I think
>	select NET_DEVLINK
>should be added to drivers/staging/qlge/Kconfig

Thank you for reminding me!

>
>> +
>> +int qlge_health_create_reporters(struct qlge_devlink *priv)
>> +{
>> +	int err;
>> +
>> +	struct devlink_health_reporter *reporter;
>> +	struct devlink *devlink;
>> +
>> +	devlink = priv_to_devlink(priv);
>> +	reporter =
>> +		devlink_health_reporter_create(devlink, &qlge_reporter_ops,
>> +					       0,
>> +					       priv);
>> +	if (IS_ERR(reporter)) {
>> +		netdev_warn(priv->ndev,
>> +			    "Failed to create reporter, err = %ld\n",
>> +			    PTR_ERR(reporter));
>> +		return PTR_ERR(reporter);
>> +	}
>> +	priv->reporter = reporter;
>> +
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +
>
>Stray newlines

Will fix it in v1.

>
>> diff --git a/drivers/staging/qlge/qlge_health.h b/drivers/staging/qlge/qlge_health.h
>> new file mode 100644
>> index 000000000000..07d3bafab845
>> --- /dev/null
>> +++ b/drivers/staging/qlge/qlge_health.h
>> @@ -0,0 +1,2 @@
>> +#include <net/devlink.h>
>> +int qlge_health_create_reporters(struct qlge_devlink *priv);
>
>I would suggest to put this in qlge.h instead of creating a new file.

Although there are only two lines for now, is it possible qlge will add
more devlink code? If that's the case, a file to single out these code
is necessary as is the same to some other drivers,

     $ find drivers -name *health*.h
     drivers/net/ethernet/mellanox/mlx5/core/en/health.h

     $ find drivers -name *devlink*.h
     drivers/net/ethernet/huawei/hinic/hinic_devlink.h
     drivers/net/ethernet/mellanox/mlx5/core/devlink.h
     drivers/net/ethernet/mellanox/mlx5/core/en/devlink.h
     drivers/net/ethernet/intel/ice/ice_devlink.h
     drivers/net/ethernet/pensando/ionic/ionic_devlink.h
     drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.h

>
>> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
>> index 1650de13842f..b2be7f4b7dd6 100644
>> --- a/drivers/staging/qlge/qlge_main.c
>> +++ b/drivers/staging/qlge/qlge_main.c
>> @@ -42,6 +42,7 @@
>>  #include <net/ip6_checksum.h>
>>
>>  #include "qlge.h"
>> +#include "qlge_health.h"
>>
>>  char qlge_driver_name[] = DRV_NAME;
>>  const char qlge_driver_version[] = DRV_VERSION;
>> @@ -4550,6 +4551,8 @@ static void ql_timer(struct timer_list *t)
>>  	mod_timer(&qdev->timer, jiffies + (5 * HZ));
>>  }
>>
>> +static const struct devlink_ops qlge_devlink_ops;
>> +
>>  static int qlge_probe(struct pci_dev *pdev,
>>  		      const struct pci_device_id *pci_entry)
>>  {
>> @@ -4557,6 +4560,13 @@ static int qlge_probe(struct pci_dev *pdev,
>>  	struct ql_adapter *qdev = NULL;
>>  	static int cards_found;
>>  	int err = 0;
>> +	struct devlink *devlink;
>> +	struct qlge_devlink *qlge_dl;
>> +
>> +	devlink = devlink_alloc(&qlge_devlink_ops, sizeof(struct qlge_devlink));
>> +	if (!devlink)
>> +		return -ENOMEM;
>> +	qlge_dl = devlink_priv(devlink);
>>
>>  	ndev = alloc_etherdev_mq(sizeof(struct ql_adapter),
>>  				 min(MAX_CPUS,
>> @@ -4615,6 +4625,15 @@ static int qlge_probe(struct pci_dev *pdev,
>>  		free_netdev(ndev);
>>  		return err;
>>  	}
>> +
>> +	err = devlink_register(devlink, &pdev->dev);
>> +	if (err)
>> +		devlink_free(devlink);
>
>Are you sure it's safe to continue devlink init after an error here?
>Again, that does not resemble usage of devlink in other drivers (ex.
>bnxt).

Thank you for pointing out my neglect!

>
>> +
>> +	qlge_health_create_reporters(qlge_dl);
>> +	qlge_dl->qdev = qdev;
>> +	qlge_dl->ndev = ndev;
>> +	qdev->devlink = qlge_dl;
>>  	/* Start up the timer to trigger EEH if
>>  	 * the bus goes dead
>>  	 */
>> @@ -4647,6 +4666,8 @@ static void qlge_remove(struct pci_dev *pdev)
>>  	unregister_netdev(ndev);
>>  	ql_release_all(pdev);
>>  	pci_disable_device(pdev);
>> +	devlink_unregister(priv_to_devlink(qdev->devlink));
>> +	devlink_health_reporter_destroy(qdev->devlink->reporter);
>
>Isn't the order of those two calls mixed up?

I haven't studied the code to figure out why but other drivers also
use the same order.
>
>>  	free_netdev(ndev);
>>  }
>>
>> --
>> 2.27.0
>>

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
