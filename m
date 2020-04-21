Return-Path: <SRS0=yja0=6F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F95C54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 10:46:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A7F20672
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 10:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O7qTANdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A7F20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7750B2094B;
	Tue, 21 Apr 2020 10:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eV+lENQ7zBgn; Tue, 21 Apr 2020 10:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A512120435;
	Tue, 21 Apr 2020 10:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D039C1797;
	Tue, 21 Apr 2020 10:45:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB629C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D758986A34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LACPwv6Ggsge
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F2B686A24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=O3z8tiB0KNUoaHIWtCxeAryx/6WqtVF23oyjsfGvCks=; b=O7qTANdvjxNuowPxPl4D5FlFtj
 5uXhky8gOscZk7ar2oLJFQreHkW1LhAFYzJq126Ucshq9k0urkea4CXyxk1RDACePzVE+W2byODpq
 FOfGvYULRnRJQngQ54Jqp0MqsVuIZsK2DKsZB9N+B1Rkzl80BqkHBe3FV182QWWuVg3LXZJ3nhNSf
 6WSAwZch4IkK6H9VV+wZICukXVfrknpLF78dnDX6zOXQ5OWwNm8JniXD8UHbVnneLo8TxN0i72TvZ
 av3p7dhFtzVkfc7041rCh8EwpIJ4y+c1i18nBKyBkMA1nHEpGU8+f42NtV3AcqzFsAB4I9ywZjKhb
 /cMolnzw==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQqPc-0005LD-BC; Tue, 21 Apr 2020 10:45:56 +0000
Date: Tue, 21 Apr 2020 12:45:52 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200421124552.6efe8ef7@coco.lan>
In-Reply-To: <bd14efb7-6144-1e0d-7cff-459f6d1c9a94@gmail.com>
References: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
 <20200420083617.7cdcbd1c@coco.lan>
 <bd14efb7-6144-1e0d-7cff-459f6d1c9a94@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Jonathan Corbet <corbet@lwn.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Is anyone working on fixing warnings
 these Documentation files ?
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

Em Tue, 21 Apr 2020 11:04:01 +0200
Saheed Bolarinwa <refactormyself@gmail.com> escreveu:

> On 4/20/20 8:36 AM, Mauro Carvalho Chehab wrote:
> > Em Mon, 20 Apr 2020 02:56:18 +0200
> > Saheed Bolarinwa <refactormyself@gmail.com> escreveu:
> >  
> >> Hello,
> >>
> >> Please is there anyone working on fixing these files. I have have
> >> checked the email archive,
> >>
> >> though I surely have not search thoroughly.
> >>
> >> Please, let me know if you are working on any of these:
> >>
> >>
> >> - Documentation/admin-guide/ras.rst
> >>
> >> - Documentation/virt/kvm/amd-memory-encryption.rst
> >>
> >> - Documentation/trace/events.rst
> >>
> >> - Documentation/power/pm_qos_interface.rst
> >>
> >> - Documentation/process/programming-language.rst
> >>
> >> - Documentation/filesystems/fuse.rst
> >>
> >> - Documentation/admin-guide/bootconfig.rst
> >>
> >> - Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
> >>
> >> - Documentation/filesystems/ubifs-authentication.rst
> >>
> >> - Documentation/driver-api/driver-model/driver.rst
> >>
> >> - Documentation/driver-api/gpio/driver.rst
> >>
> >> - Documentation/driver-api/thermal/cpu-idle-cooling.rst  
> > There is a set of fixes from me at:
> >
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=docs-fixes
> >
> > that were already submitted, but I guess Jon didn't merge yet.
> >
> > Btw, if you want to do any work, I suggest you to take a look on
> > this tree:
> >
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs
> >
> > Where I merged all patches I did already for documentation and
> > that weren't merged upstream yet.  
> 
> Hello,
> 
> Thank you for the response, I have checked the link you gave:
> 
> https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs
> 
> I am not sure if it is the best way to figure out what is not being 
> worked on,
> 
> but what I did was to search for the files I listed previously and I 
> could not
> 
> find the ones listed below:
> 
> - Documentation/admin-guide/ras.rst
> 
> - Documentation/virt/kvm/amd-memory-encryption.rst
> 
> - Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
> 
> - Documentation/filesystems/ubifs-authentication.rst
> 
> - Documentation/driver-api/driver-model/driver.rst
> 
> 
> Can I assume they are not being worked on, at least by you?

No, but I'm also not getting any warnings from some of the above.

The warnings I'm getting on my tree[1] are enclosed below.

Please notice that, while I didn't add any new patch, I just
rebased it on the top of linux-next latest tag (next-20200421).

[1] https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs

Thanks,
Mauro


Warning: Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
Warning: Documentation/mips/ingenic-tcu.rst references a file that doesn't exist: Documentation/devicetree/bindings/timer/ingenic,tcu.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/arm-cctrng.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/rockchip-vpu.txt
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
Warning: tools/testing/selftests/vm/protection_keys.c references a file that doesn't exist: Documentation/vm/protection-keys.txt
./kernel/rcu/tree.c:2914: warning: Function parameter or member 'count' not described in 'kfree_rcu_cpu'
./mm/vmalloc.c:1840: warning: Excess function parameter 'prot' description in 'vm_map_ram'
./include/linux/host1x.h:66: warning: Function parameter or member 'parent' not described in 'host1x_client'
./include/linux/host1x.h:66: warning: Function parameter or member 'usecount' not described in 'host1x_client'
./include/linux/host1x.h:66: warning: Function parameter or member 'lock' not described in 'host1x_client'
./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
./include/linux/phylink.h:333: warning: Function parameter or member 'pcs_config' not described in 'int'
./include/linux/phylink.h:333: warning: Excess function parameter 'config' description in 'int'
./include/linux/phylink.h:333: warning: Excess function parameter 'mode' description in 'int'
./include/linux/phylink.h:333: warning: Excess function parameter 'interface' description in 'int'
./include/linux/phylink.h:333: warning: Excess function parameter 'advertising' description in 'int'
./include/linux/phylink.h:342: warning: Function parameter or member 'pcs_an_restart' not described in 'void'
./include/linux/phylink.h:342: warning: Excess function parameter 'config' description in 'void'
./include/linux/phylink.h:358: warning: Function parameter or member 'pcs_link_up' not described in 'void'
./include/linux/phylink.h:358: warning: Excess function parameter 'config' description in 'void'
./include/linux/phylink.h:358: warning: Excess function parameter 'mode' description in 'void'
./include/linux/phylink.h:358: warning: Excess function parameter 'interface' description in 'void'
./include/linux/phylink.h:358: warning: Excess function parameter 'speed' description in 'void'
./include/linux/phylink.h:358: warning: Excess function parameter 'duplex' description in 'void'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:92: warning: Function parameter or member 'vm' not described in 'amdgpu_vm_eviction_lock'
./drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
./drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3374: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3474: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3374: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3474: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3374: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3474: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:435: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3374: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3474: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:331: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
./include/linux/spi/spi.h:665: warning: Function parameter or member 'buswidth_override_bits' not described in 'spi_controller'
./include/linux/spi/spi.h:944: warning: Function parameter or member 'timestamped' not described in 'spi_transfer'
./include/linux/gpio/driver.h:499: warning: Function parameter or member 'gc' not described in 'gpiochip_add_data'
./include/linux/gpio/driver.h:499: warning: Excess function parameter 'chip' description in 'gpiochip_add_data'
./include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
./include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
./drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
./drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
./include/linux/kcsan-checks.h:335: warning: duplicate section name 'Note'
./include/linux/usb.h:713: warning: Function parameter or member 'use_generic_driver' not described in 'usb_device'
./include/linux/usb.h:1253: warning: Function parameter or member 'match' not described in 'usb_device_driver'
./include/linux/usb.h:1253: warning: Function parameter or member 'id_table' not described in 'usb_device_driver'
./include/linux/iio/iio.h:574: warning: Function parameter or member 'read_buf' not described in 'iio_dev'
./include/linux/iio/iio.h:574: warning: Function parameter or member 'read_buf_len' not described in 'iio_dev'
./include/kunit/test.h:182: warning: Function parameter or member 'debugfs' not described in 'kunit_suite'
./include/kunit/test.h:182: warning: Function parameter or member 'log' not described in 'kunit_suite'
./include/kunit/test.h:268: warning: Excess function parameter 'suites' description in 'kunit_test_suites'
./drivers/infiniband/core/umem_odp.c:161: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_alloc_child'
./drivers/infiniband/core/umem_odp.c:225: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_get'
./drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function parameter or member 'all_list' not described in 'iser_fr_desc'
./drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function parameter or member 'all_list' not described in 'iser_fr_pool'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd0' not described in 'opa_vesw_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd1' not described in 'opa_vesw_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd2' not described in 'opa_vesw_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd3' not described in 'opa_vesw_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd4' not described in 'opa_vesw_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd0' not described in 'opa_per_veswport_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd1' not described in 'opa_per_veswport_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd2' not described in 'opa_per_veswport_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd3' not described in 'opa_per_veswport_info'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:342: warning: Function parameter or member 'reserved' not described in 'opa_veswport_summary_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd0' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd1' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd2' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd3' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd4' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd5' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd6' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd7' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd8' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd9' not described in 'opa_veswport_error_counters'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:460: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:485: warning: Function parameter or member 'reserved' not described in 'opa_vnic_notice_attr'
./drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:500: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad_trap'
./include/drm/drm_dp_helper.h:1764: warning: Function parameter or member 'hbr2_reset' not described in 'drm_dp_phy_test_params'
./drivers/gpu/drm/drm_dp_helper.c:1599: warning: Function parameter or member 'dp_rev' not described in 'drm_dp_set_phy_test_pattern'
./include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
./include/net/mac80211.h:832: warning: Enum value 'IEEE80211_TX_CTRL_HW_80211_ENCAP' not described in enum 'mac80211_tx_control_flags'
./net/mac80211/sta_info.h:104: warning: Enum value 'WLAN_STA_USES_ENCRYPTION' not described in enum 'ieee80211_sta_info_flags'
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
./include/linux/dma-buf.h:347: warning: Incorrect use of kernel-doc format:          * @move_notify
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:105: WARNING: Unexpected indentation.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:108: WARNING: Unexpected indentation.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:109: WARNING: Block quote ends without a blank line; unexpected unindent.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:112: WARNING: Block quote ends without a blank line; unexpected unindent.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:120: WARNING: Unexpected indentation.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:121: WARNING: Block quote ends without a blank line; unexpected unindent.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:132: WARNING: Unexpected indentation.
/devel/v4l/docs/Documentation/admin-guide/mm/hugetlbpage.rst:135: WARNING: Block quote ends without a blank line; unexpected unindent.
/devel/v4l/docs/Documentation/admin-guide/sysctl/kernel.rst:295: WARNING: Title underline too short.

hung_task_all_cpu_backtrace:
================
/devel/v4l/docs/Documentation/admin-guide/sysctl/kernel.rst:295: WARNING: Title underline too short.

hung_task_all_cpu_backtrace:
================
/devel/v4l/docs/Documentation/admin-guide/sysctl/kernel.rst:578: WARNING: Title underline too short.

oops_all_cpu_backtrace:
================
/devel/v4l/docs/Documentation/admin-guide/sysctl/kernel.rst:578: WARNING: Title underline too short.

oops_all_cpu_backtrace:
================
/devel/v4l/docs/Documentation/virt/kvm/amd-memory-encryption.rst:76: WARNING: Inline literal start-string without end-string.
/devel/v4l/docs/Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.
checking consistency... /devel/v4l/docs/Documentation/watch_queue.rst: WARNING: document isn't included in any toctree

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
