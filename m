Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A63EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:17:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5DB206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oFOGwTQx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5DB206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2350D87A60;
	Mon, 27 Jul 2020 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPFVd3oMJwYA; Mon, 27 Jul 2020 13:17:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5994A864E6;
	Mon, 27 Jul 2020 13:17:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39FC2C0050;
	Mon, 27 Jul 2020 13:17:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8462FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 78B3785E60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6izlrtZrGPU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B689585C11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:17:02 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RD6ulU071929;
 Mon, 27 Jul 2020 13:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=f0tYF1Lyo1O+rXlsLaTIUXOTNe5xa73rA7qmFjlVp0A=;
 b=oFOGwTQxPC173fC1DK090kUF5pNI5jAfbtAQqQpea9b2D5KpIZOljmzt2wx05XvTtxCr
 g8umNtuDMbZV2mji+0hWtvhXOg9TbI49T2js6YdR8cBLXy/ATKagGmnjXD5OzjQ+kUOG
 +BHWW9FeUfPnilypy51M8WPPIut03u8+EFs1RfmwhtYpveoicpkgzzLi6HvFbnLXnh9T
 GCwus5EXpF9HeQql/glssT+fHDwg+2cD0PEDJEz2h0VKb2/XCbBpeaUcjpxNvk0YkTmb
 fTfAK64N2E+hviFHnHYzb2vnWK+htgvLZcxFiIlM1bauKlYc8d6kajBczbBnIR9bzx6T Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32hu1j1ehn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Jul 2020 13:16:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RD9Hrm063932;
 Mon, 27 Jul 2020 13:16:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 32hu5qpa5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 13:16:26 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06RDGHxF009068;
 Mon, 27 Jul 2020 13:16:18 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jul 2020 06:16:17 -0700
Date: Mon, 27 Jul 2020 16:16:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200727131608.GD1913@kadam>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270096
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > video_put_user() is copying uninitialized stack memory to userspace due
> > to the compiler not initializing holes in the structures declared on the
> > stack. Fix it by initializing `ev32` and `vb32` using memset().
> >
> > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Thanks a lot for addressing this! I now see that I actually created a similar
> bugfix for it back in January, but for some reason that got stuck in my
> backlog and I never wrote a proper description for it or sent it out to the
> list, sorry about that. I would hope we could find a way to have either
> the compiler or sparse warn if we copy uninitialized data to user space,
> but we now don't even check for that within the kernel any more.

Here are my latest warnings on linux-next from Friday.

block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')
drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')
drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information
drivers/gpu/drm/drm_bufs.c:1357 copy_one_buf() warn: check that 'v' doesn't leak information (struct has a hole after 'flags')
drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:785 amdgpu_info_ioctl() warn: check that 'dev_info' doesn't leak information (struct has a hole after 'pa_sc_tile_steering_override')
drivers/block/floppy.c:3132 raw_cmd_copyout() warn: check that 'cmd' doesn't leak information (struct has a hole after 'flags')
drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')
drivers/media/v4l2-core/v4l2-ioctl.c:3204 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
drivers/media/v4l2-core/v4l2-ioctl.c:3229 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
drivers/net/wan/sbni.c:1320 sbni_ioctl() warn: check that 'flags' doesn't leak information (struct has a hole after 'rxl')
drivers/infiniband/hw/qedr/verbs.c:1816 qedr_create_user_qp() warn: check that 'uresp' doesn't leak information (struct has a hole after 'sq_icid')
drivers/infiniband/hw/cxgb4/provider.c:107 c4iw_alloc_ucontext() warn: check that 'uresp.reserved' doesn't leak information
drivers/tty/vt/vt_ioctl.c:1218 vt_compat_ioctl() warn: check that 'op' doesn't leak information (struct has a hole after 'charcount')
net/smc/smc_diag.c:181 __smc_diag_dump() warn: check that 'dinfo' doesn't leak information (struct has a hole after 'linkid')
net/sched/act_ife.c:638 tcf_ife_dump() warn: check that 'opt' doesn't leak information (struct has a hole after 'flags')
net/sched/act_skbmod.c:232 tcf_skbmod_dump() warn: check that 'opt' doesn't leak information (struct has a hole after 'bindcnt')
net/sched/act_connmark.c:187 tcf_connmark_dump() warn: check that 'opt' doesn't leak information (struct has a hole after 'zone')
net/openvswitch/conntrack.c:311 ovs_ct_put_key() warn: check that 'orig' doesn't leak information (struct has a hole after 'ipv4_proto')
net/openvswitch/conntrack.c:322 ovs_ct_put_key() warn: check that 'orig' doesn't leak information (struct has a hole after 'ipv6_proto')
net/rds/recv.c:492 rds_notify_queue_get() warn: check that 'cmsg' doesn't leak information (struct has a hole after 'status')
net/xdp/xsk.c:870 xsk_getsockopt() warn: check that 'stats.rx_ring_full' doesn't leak information
kernel/signal.c:3524 __do_sys_rt_sigtimedwait() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
kernel/signal.c:3524 __do_sys_rt_sigtimedwait() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
kernel/signal.c:3556 __do_sys_rt_sigtimedwait_time32() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
kernel/signal.c:3556 __do_sys_rt_sigtimedwait_time32() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
kernel/signal.c:4055 __do_sys_sigaltstack() warn: check that 'old' doesn't leak information (struct has a hole after 'ss_flags')
kernel/signal.c:4055 __do_sys_sigaltstack() warn: check that 'old' doesn't leak information (struct has a hole after 'ss_flags')
kernel/ptrace.c:998 ptrace_get_syscall_info() warn: check that 'info' doesn't leak information (struct has a hole after 'op')

regards,
dan carpenter
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
