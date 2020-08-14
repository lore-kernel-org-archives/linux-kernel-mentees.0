Return-Path: <SRS0=D2Vm=BY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE05EC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 16:06:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CC02078D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Aug 2020 16:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB4z7pW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CC02078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 84FA8875C4;
	Fri, 14 Aug 2020 16:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpMYepfk9Th6; Fri, 14 Aug 2020 16:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C783E87556;
	Fri, 14 Aug 2020 16:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9F4DC013C;
	Fri, 14 Aug 2020 16:06:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46B99C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2EA0888D3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WU-MA3OwzzSI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4651588D24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 16:06:14 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t10so4368665plz.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Aug 2020 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ga6cPRwuO4+aUmwpjKpxUt6/hU3GW82MOp7VKaSKxU=;
 b=AB4z7pW8d9hQKZSvIKQWZOBE0HrYz3m/eQG/R5Pgpto89ZnRXj8IlpV+1XGj5Ygat6
 EZsmdAnGdq2ho3XDxWcLZWclgIC44P7Glgh4pk9i9gIJqnGEmtn2M6EkKYNj20h5G/HI
 ii/FktRzGf6tw59GmrwWr0sCTO2XuMGpRk25DqC8odAxUyV94GOjRwkvcz4xnXwcXhWE
 hQD4GL3oWTtpHtOicMt63HKMMI7U9EVemOlWiXuxlXYYL00IYrEOKG9syrIY50JeAbH4
 Whvn9TiuUs7ge22ofxlZUcn9ZGposuvAnzd/JkardYoTfnVtonE2cRqYXESIEXyExc8N
 /x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ga6cPRwuO4+aUmwpjKpxUt6/hU3GW82MOp7VKaSKxU=;
 b=JwjApFozW/S1c0/sQYWFW4fBrv3cP1Plage9nyn5AKFIMRFGCkll10REMmEyqP8/Ak
 9ithTY7Uq+HcsLUTtcDF6ToRQnYw1VFmC6aT5hp01CioAvYsoMWnBHg8olHpSFKx6LCn
 PlqynMnuqXVCzQNPnZn/kO1CGmviyT5EQlerufbAAMK8NNuhvLrw/qRrug/gkkkEhQaa
 PSBoyq3wfO+R/p31WqeGnCY/8+2skhFwXwfjiykazI+a8W8aEDtHw2yT7cAlvLIbVe9M
 46JteNTT+N1OExUCetzCof6RTHbzDFwSlxysydr5ok4BKH0gznQXS0TZatoSxlVSh8sI
 JnFw==
X-Gm-Message-State: AOAM533bfF8dn0zK+xiWfjTytOJteJSmJMGHf+fb6YHDICaU3p1yJIU2
 /41S3A8GGSM4Jvpj0sfj+ZI=
X-Google-Smtp-Source: ABdhPJzk79oByEB1iqFTEWyMxlkKLWJ7CnumFQsQMNOpAvUiIFMY2n1EA9MnQpLDrtwIiNoT9F/cuA==
X-Received: by 2002:a17:90b:23c7:: with SMTP id
 md7mr2828060pjb.204.1597421173764; 
 Fri, 14 Aug 2020 09:06:13 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id x12sm9453592pff.48.2020.08.14.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 09:06:13 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: netdev@vger.kernel.org
Date: Sat, 15 Aug 2020 00:05:58 +0800
Message-Id: <20200814160601.901682-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Michal Kubecek <mkubecek@suse.cz>, GR-Linux-NIC-Dev@marvell.com,
 Manish Chopra <manishc@marvell.com>,
 Benjamin Poirier <benjamin.poirier@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC 0/3] staging: qlge: Re-writing the
	debugging features
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

This patch set aims to avoid dumping registers, data structures and
coredump to dmesg and also to reduce the code size of the qlge driver.

As pointed out by Benjamin [1],

> At 2000 lines, qlge_dbg.c alone is larger than some entire ethernet
> drivers. Most of what it does is dump kernel data structures or pci
> memory mapped registers to dmesg. There are better facilities for that.
> My thinking is not simply to delete qlge_dbg.c but to replace it, making
> sure that most of the same information is still available. For data
> structures, crash or drgn can be used; possibly with a script for the
> latter which formats the data. For pci registers, they should be
> included in the ethtool register dump and a patch added to ethtool to
> pretty print them. That's what other drivers like e1000e do. For the
> "coredump", devlink health can be used.

So the debugging features are re-written following Benjamin's advice,
   - use ethtool to dump registers
   - dump kernel data structures in drgn
   - use devlink health to do coredump

The get_regs ethtool_ops has already implemented. What lacks is a patch
for the userland ethtool to do the pretty-printing. I haven't yet provided
a patch to the userland ethtool because I'm aware ethtool is moving towards
the netlink interface [2]. I'm curious if a generalized mechanism of
pretty-printing will be implemented thus making pretty-printing for a
specific driver unnecessary. As of this writing, `-d|--register-dump`
hasn't been implemented for the netlink interface.


To dump kernel data structures, the following Python script can be used
in drgn,


    ```python
    def align(x, a):
        """the alignment a should be a power of 2
        """
        mask = a - 1
        return (x+ mask) & ~mask

    def struct_size(struct_type):
        struct_str = "struct {}".format(struct_type)
        return sizeof(Object(prog, struct_str, address=0x0))

    def netdev_priv(netdevice):
        NETDEV_ALIGN = 32
        return netdevice.value_() + align(struct_size("net_device"), NETDEV_ALIGN)

    name = 'xxx'
    qlge_device = None
    netdevices = prog['init_net'].dev_base_head.address_of_()
    for netdevice in list_for_each_entry("struct net_device", netdevices, "dev_list"):
        if netdevice.name.string_().decode('ascii') == name:
            print(netdevice.name)

    ql_adapter = Object(prog, "struct ql_adapter", address=netdev_priv(qlge_device))
    ```

The struct ql_adapter will be printed in drgn as follows,
    >>> ql_adapter
    (struct ql_adapter){
            .ricb = (struct ricb){
                    .base_cq = (u8)0,
                    .flags = (u8)120,
                    .mask = (__le16)26637,
                    .hash_cq_id = (u8 [1024]){ 172, 142, 255, 255 },
                    .ipv6_hash_key = (__le32 [10]){},
                    .ipv4_hash_key = (__le32 [4]){},
            },
            .flags = (unsigned long)0,
            .wol = (u32)0,
            .nic_stats = (struct nic_stats){
                    .tx_pkts = (u64)0,
                    .tx_bytes = (u64)0,
                    .tx_mcast_pkts = (u64)0,
                    .tx_bcast_pkts = (u64)0,
                    .tx_ucast_pkts = (u64)0,
                    .tx_ctl_pkts = (u64)0,
                    .tx_pause_pkts = (u64)0,
                    ...
            },
            .active_vlans = (unsigned long [64]){
                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52780853100545, 18446744073709551615,
                    18446619461681283072, 0, 42949673024, 2147483647,
            },
            .rx_ring = (struct rx_ring [17]){
                    {
                            .cqicb = (struct cqicb){
                                    .msix_vect = (u8)0,
                                    .reserved1 = (u8)0,
                                    .reserved2 = (u8)0,
                                    .flags = (u8)0,
                                    .len = (__le16)0,
                                    .rid = (__le16)0,
                                    ...
                            },
                            .cq_base = (void *)0x0,
                            .cq_base_dma = (dma_addr_t)0,
                    }
                    ...
            }
    }


And the coredump obtained via devlink in json format looks like,

    $ devlink health dump show DEVICE reporter coredump -p -j
    {
        "Core Registers": {
            "segment": 1,
            "values": [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ]
        },
        "Test Logic Regs": {
            "segment": 2,
            "values": [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ]
        },
        "RMII Registers": {
            "segment": 3,
            "values": [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ]
        },
        ...
        "Sem Registers": {
            "segment": 50,
            "values": [ 0,0,0,0 ]
        }
    }

Since I don't have a QLGE device and neither could I find a software
simulator, I put some functions into e1000 to get the above result.

I notice with the qlge_force_coredump module parameter set, ethtool
can also get the coredump. I'm not sure which tool is more suitable for
the coredump feature.

[1] https://lkml.org/lkml/2020/6/30/19
[2] https://www.kernel.org/doc/html/latest/networking/ethtool-netlink.html

Coiby Xu (3):
  Initialize devlink health dump framework for the dlge driver
  coredump via devlink health reporter
  clean up code that dump info to dmesg

 drivers/staging/qlge/Makefile       |   2 +-
 drivers/staging/qlge/qlge.h         |  91 +---
 drivers/staging/qlge/qlge_dbg.c     | 672 ----------------------------
 drivers/staging/qlge/qlge_ethtool.c |   1 -
 drivers/staging/qlge/qlge_health.c  | 156 +++++++
 drivers/staging/qlge/qlge_health.h  |   2 +
 drivers/staging/qlge/qlge_main.c    |  27 +-
 7 files changed, 189 insertions(+), 762 deletions(-)
 create mode 100644 drivers/staging/qlge/qlge_health.c
 create mode 100644 drivers/staging/qlge/qlge_health.h

--
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
