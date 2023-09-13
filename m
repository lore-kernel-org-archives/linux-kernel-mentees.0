Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C854FEDEC6B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Sep 2023 14:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D7261058;
	Wed, 13 Sep 2023 14:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D7261058
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=foaaS8V8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIXpEWY-eez3; Wed, 13 Sep 2023 14:41:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C1A0D60F56;
	Wed, 13 Sep 2023 14:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A0D60F56
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97C29C0039;
	Wed, 13 Sep 2023 14:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB11CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Sep 2023 14:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2DD74060C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Sep 2023 14:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2DD74060C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=foaaS8V8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja7dyDQdOc-t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Sep 2023 14:41:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90C6940480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Sep 2023 14:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C6940480
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56594617D2;
 Wed, 13 Sep 2023 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DD2C433C8;
 Wed, 13 Sep 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694616084;
 bh=keiQAhGl1KiQuI4EQlUBS5t1hZLSooT0aQknqkd3RNw=;
 h=From:Date:To:Cc:Subject:References:In-Reply-To:From;
 b=foaaS8V8By/GEEvlESL1FRYWFDGeHe79QknknqA+frVW/9g7ijSn5WU+r1LQ1lGZW
 9D3l/CGQXnabSLR/8ORf3cw8GXVj/9n7zoREKf1z4tmjPJctX5dxL4XT8I2wkc/KLI
 XyZmlBSSd072qdV2KWsOuZUTE73bIUkX+48pptf/YKLX0B7PLFUb99f5kMH1Le1qpb
 9OhaBaU2RJCS1ncyZnSglj87zrPz1N3NGoVO5+mo3zpyWOko5+6YH9zmbrY8mpcqEB
 wljLjxQBKh0muJW8qtW6alwzc4WnOkXMuGlqvPEqdWopZuD7YUYuk7BYAhTVwoDbHk
 aC9GcvW4hHkow==
From: mripard@kernel.org
Date: Wed, 13 Sep 2023 16:41:22 +0200
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/tests: provide exit function
Message-ID: <4epqmvfgjlj4sz7zj6wy5z2qkezif2te3teiwhbf5wv3g3nkeo@36wbg7ksnpy4>
References: <20230913083223.28684-1-jose.pekkarinen@foxhound.fi>
 <63yq44aikrrymqz5e5mg5mwwnaetud7sdxju2lgtsupq52b7hm@fydwmsm4yh54>
 <46d60d7e69c470e9550a2e7b7c750f12@foxhound.fi>
MIME-Version: 1.0
In-Reply-To: <46d60d7e69c470e9550a2e7b7c750f12@foxhound.fi>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 christian.koenig@amd.com
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
Content-Type: multipart/mixed; boundary="===============0059367537207094103=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0059367537207094103==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upz45bzpjfn2lqwm"
Content-Disposition: inline


--upz45bzpjfn2lqwm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 05:01:40PM +0300, Jos=E9 Pekkarinen wrote:
> On 2023-09-13 12:50, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Sep 13, 2023 at 11:32:23AM +0300, Jos=E9 Pekkarinen wrote:
> > > Running drm_exec_test by modprobing the module I
> > > observe the following output:
> > >=20
> > > [  424.471936] KTAP version 1
> > > [  424.471942] 1..1
> > > [  424.472446]     KTAP version 1
> > > [  424.472450]     # Subtest: drm_exec
> > > [  424.472453]     # module: drm_exec_test
> > > [  424.472459]     1..7
> > > [  424.479082]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [  424.479095] BUG: KASAN: slab-use-after-free in
> > > drm_dev_put.part.0+0x4b/0x90 [drm]
> > > [  424.479426] Read of size 8 at addr ffff888132d3e028 by task
> > > kunit_try_catch/1866
> > > [  424.479436]
> > > [  424.479442] CPU: 1 PID: 1866 Comm: kunit_try_catch Tainted: G
> > > N 6.6.0-rc1-dirty #2
> >=20
> > That's suspicious
> >=20
> > > [  424.479446] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> > > BIOS 0.0.0 02/06/2015
> > > [  424.479446] Call Trace:
> > > [  424.479446]  <TASK>
> > > [  424.479446]  dump_stack_lvl+0x43/0x60
> > > [  424.479446]  print_report+0xcf/0x660
> > > [  424.479446]  ? __virt_addr_valid+0xd9/0x160
> > > [  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
> > > [  424.479446]  kasan_report+0xda/0x110
> > > [  424.479446]  ? drm_dev_put.part.0+0x4b/0x90 [drm]
> > > [  424.479446]  drm_dev_put.part.0+0x4b/0x90 [drm]
> > > [  424.479446]  release_nodes+0x83/0x160
> > > [  424.479446]  devres_release_all+0xe6/0x130
> > > [  424.479446]  ? __pfx_devres_release_all+0x10/0x10
> > > [  424.479446]  ? mutex_unlock+0x80/0xd0
> > > [  424.479446]  ? __pfx_mutex_unlock+0x10/0x10
> > > [  424.479446]  device_unbind_cleanup+0x16/0xc0
> > > [  424.479446]  device_release_driver_internal+0x28b/0x2e0
> > > [  424.479446]  bus_remove_device+0x124/0x1d0
> > > [  424.479446]  device_del+0x23d/0x580
> > > [  424.479446]  ? __pfx_device_del+0x10/0x10
> > > [  424.479446]  ? kasan_set_track+0x21/0x30
> > > [  424.479446]  ? _raw_spin_lock_irqsave+0x98/0xf0
> > > [  424.479446]  platform_device_del.part.0+0x19/0xe0
> > > [  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
> > > [  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
> > > [  424.479446]  ? __pfx_kunit_try_run_case_cleanup+0x10/0x10 [kunit]
> > > [  424.479446]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> > > [kunit]
> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
> > > [  424.479446]  kthread+0x184/0x1c0
> > > [  424.479446]  ? __pfx_kthread+0x10/0x10
> > > [  424.479446]  ret_from_fork+0x30/0x50
> > > [  424.479446]  ? __pfx_kthread+0x10/0x10
> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
> > > [  424.479446]  </TASK>
> > > [  424.479446]
> > > [  424.479446] Allocated by task 1865:
> > > [  424.479446]  kasan_save_stack+0x2f/0x50
> > > [  424.479446]  kasan_set_track+0x21/0x30
> > > [  424.479446]  __kasan_kmalloc+0xa6/0xb0
> > > [  424.479446]  __kmalloc+0x5d/0x160
> > > [  424.479446]  kunit_kmalloc_array+0x1c/0x50 [kunit]
> > > [  424.479446]  drm_exec_test_init+0xef/0x260 [drm_exec_test]
> > > [  424.479446]  kunit_try_run_case+0x6e/0x100 [kunit]
> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
> > > [  424.479446]  kthread+0x184/0x1c0
> > > [  424.479446]  ret_from_fork+0x30/0x50
> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
> > > [  424.479446]
> > > [  424.479446] Freed by task 1866:
> > > [  424.479446]  kasan_save_stack+0x2f/0x50
> > > [  424.479446]  kasan_set_track+0x21/0x30
> > > [  424.479446]  kasan_save_free_info+0x27/0x40
> > > [  424.479446]  ____kasan_slab_free+0x166/0x1c0
> > > [  424.479446]  slab_free_freelist_hook+0x9f/0x1e0
> > > [  424.479446]  __kmem_cache_free+0x187/0x2d0
> > > [  424.479446]  kunit_remove_resource+0xfa/0x140 [kunit]
> > > [  424.479446]  kunit_cleanup+0x47/0xa0 [kunit]
> > > [  424.479446]  kunit_generic_run_threadfn_adapter+0x29/0x50 [kunit]
> > > [  424.479446]  kthread+0x184/0x1c0
> > > [  424.479446]  ret_from_fork+0x30/0x50
> > > [  424.479446]  ret_from_fork_asm+0x1b/0x30
> > > [  424.479446]
> > > [  424.479446] The buggy address belongs to the object at
> > > ffff888132d3e000
> > > [  424.479446]  which belongs to the cache kmalloc-256 of size 256
> > > [  424.479446] The buggy address is located 40 bytes inside of
> > > [  424.479446]  freed 256-byte region [ffff888132d3e000,
> > > ffff888132d3e100)
> > > [  424.479446]
> > > [  424.479446] The buggy address belongs to the physical page:
> > > [  424.479446] page:0000000092ff6551 refcount:1 mapcount:0
> > > mapping:0000000000000000 index:0xffff888132d3f600 pfn:0x132d3c
> > > [  424.479446] head:0000000092ff6551 order:2 entire_mapcount:0
> > > nr_pages_mapped:0 pincount:0
> > > [  424.479446] ksm flags:
> > > 0x17ffffc0000840(slab|head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
> > > [  424.479446] page_type: 0xffffffff()
> > > [  424.479446] raw: 0017ffffc0000840 ffff888100042b40
> > > ffffea00042c8000 dead000000000003
> > > [  424.479446] raw: ffff888132d3f600 000000008020001f
> > > 00000001ffffffff 0000000000000000
> > > [  424.479446] page dumped because: kasan: bad access detected
> > > [  424.479446]
> > > [  424.479446] Memory state around the buggy address:
> > > [  424.479446]  ffff888132d3df00: fc fc fc fc fc fc fc fc fc fc fc
> > > fc fc fc fc fc
> > > [  424.479446]  ffff888132d3df80: fc fc fc fc fc fc fc fc fc fc fc
> > > fc fc fc fc fc
> > > [  424.479446] >ffff888132d3e000: fa fb fb fb fb fb fb fb fb fb fb
> > > fb fb fb fb fb
> > > [  424.479446]                                   ^
> > > [  424.479446]  ffff888132d3e080: fb fb fb fb fb fb fb fb fb fb fb
> > > fb fb fb fb fb
> > > [  424.479446]  ffff888132d3e100: fc fc fc fc fc fc fc fc fc fc fc
> > > fc fc fc fc fc
> > > [  424.479446]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [  424.481686] Disabling lock debugging due to kernel taint
> > > [  424.484124]     not ok 1 sanitycheck
> > > [  424.492981]     ok 2 test_lock
> > > [  424.503610]     ok 3 test_lock_unlock
> > > [  424.515058]     ok 4 test_duplicates
> > > [  424.530453]     ok 5 test_prepare
> > > [  424.539099]     ok 6 test_prepare_array
> > > [  424.550730]     ok 7 test_multiple_loops
> > > [  424.550743] # drm_exec: pass:6 fail:1 skip:0 total:7
> > > [  424.550750] # Totals: pass:6 fail:1 skip:0 total:7
> > > [  424.550756] not ok 5 drm_exec
> > >=20
> > > The ouptut suggest the init function is allocating a drm_device
> > > that is not being freed. This patch provides the function and
> > > add it to the kunit_suite to produce the following result of
> > > the test:
> > >=20
> > > [ 3363.342560] KTAP version 1
> > > [ 3363.342571] 1..1
> > > [ 3363.343090]     KTAP version 1
> > > [ 3363.343095]     # Subtest: drm_exec
> > > [ 3363.343098]     # module: drm_exec_test
> > > [ 3363.343103]     1..7
> > > [ 3363.353659]     ok 1 sanitycheck
> > > [ 3363.364281]     ok 2 test_lock
> > > [ 3363.375616]     ok 3 test_lock_unlock
> > > [ 3363.388741]     ok 4 test_duplicates
> > > [ 3363.402544]     ok 5 test_prepare
> > > [ 3363.413163]     ok 6 test_prepare_array
> > > [ 3363.424614]     ok 7 test_multiple_loops
> > > [ 3363.424630] # drm_exec: pass:7 fail:0 skip:0 total:7
> > > [ 3363.424637] # Totals: pass:7 fail:0 skip:0 total:7
> > > [ 3363.424643] ok 1 drm_exec
> > >=20
> > > Signed-off-by: Jos=E9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> > > ---
> > >  drivers/gpu/drm/tests/drm_exec_test.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
> > > b/drivers/gpu/drm/tests/drm_exec_test.c
> > > index 563949d777dd..7ff6bc6467d4 100644
> > > --- a/drivers/gpu/drm/tests/drm_exec_test.c
> > > +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> > > @@ -42,6 +42,19 @@ static int drm_exec_test_init(struct kunit *test)
> > >  	return 0;
> > >  }
> > >=20
> > > +static void drm_exec_test_exit(struct kunit *test)
> > > +{
> > > +	struct drm_exec_priv *priv =3D test->priv;
> > > +
> > > +	drm_kunit_helper_free_device(test, priv->dev);
> > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
> >=20
> > This shouldn't be necessary at all since 4f2b0b583baa.
>=20
>
> Reading this suggested patch I see only references to
> platform_driver_unregister, platform_device_put, and
> platform_device_del, not the ones used in this patch.

I mean, what is drm_kunit_helper_free_device calling?

Maxime
--upz45bzpjfn2lqwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQHKDAAKCRDj7w1vZxhR
xRy0AQD64PRpRQr2oE8ifP25UReMHkkoQA+V4DFE3ifHwC4JlwD/Q97uVJogsdT6
Up2HFbxP7eQYpBketEKT0iSsQs6qxwQ=
=et4w
-----END PGP SIGNATURE-----

--upz45bzpjfn2lqwm--

--===============0059367537207094103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0059367537207094103==--
