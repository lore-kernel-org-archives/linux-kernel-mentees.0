Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7795CA9ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 18:19:01 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521AB2086D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 18:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="cL4zNr0E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 521AB2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EA77FC9A;
	Fri,  1 Nov 2019 18:19:00 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1A7A40B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 18:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 13DE187B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 18:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XHAxGvMK92cPfaAjHHGpgE5zlbcUx4M/FtnAaB51oVFHN5ozTAPgfaYKhYClYriaSJvFOWlbS8wm1SVcPWZmKlfcH4ERZRcmhuSb6J2TmmO2qbF96OSME9SH8Sm8MvBYT6cAjObKP3EywRe26S733pFItxOc/V2n8gUjT1E6hpu3cwvZfYlqdh2iHOoVbUv7EsY+Hofir+6QWpmCTr/a+AenaQ+LwB5f4RCDW8bPABi/4Iz453tDo5BLq3z5nT1oAS6SgJ/uPYTzJNhw0ELmpcFMXy640cVLvf35cYGsekOUf2uTft1L2qj6en64Ga5zg2CBt8tMP0XB9JlJdXt4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pzDDAuj1TK9Tx9IqXbVDNjNvxIj6n3b5DnVaxJAWQw0=;
	b=XMFDPvbkeOk+h/zKCzvc/jNJQ5PM6BCtvt9iWnFZzkqbRDqc/zoI4QwgmPzn+eLw+ckVSntMu4cMc51hujk7re8UejtF/vjCBinwgJ005Yn0sXEGIA5iWdYLgRQxM98WcG2JVEvtGU3zTtiARMkqWeTmpbvsa9aBukZxOFhqbbNcfN+8FvrTO3l998mty3d+VhaR5EgrcegBg4x0fOERKnoPqXKe8a8odnYU4w5ILPKKWDrJGm0bOfvdoskZbztR/vnusnUBWASCkjHvJmkH+DPyh8i2jitxu86EM/qtDjNs4h2k535mN5z3J7LqHhkWcIvPswXHgG5nzHT/S4pokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pzDDAuj1TK9Tx9IqXbVDNjNvxIj6n3b5DnVaxJAWQw0=;
	b=cL4zNr0EobQSussZVcAX+cdl2ngfuL8kGcwSzpGS7wq44hekuiRDIGf3PbnFimYRiIsVM54uVPerRkOMx6iiFToZ+X9engYZLCdLWr8uXL7KDhqdpRZcAybaRPOnwDSg244SDb1knXUPMAH+cY3zoUEgJzt3a+HZbV6cyWzxSoA=
Received: from BN6SPR00MB182.namprd12.prod.outlook.com (10.175.100.23) by
	BN6PR12MB1649.namprd12.prod.outlook.com (10.172.18.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 1 Nov 2019 18:18:57 +0000
Received: from BN6SPR00MB182.namprd12.prod.outlook.com
	([fe80::a5af:c3fb:16c6:2682]) by
	BN6SPR00MB182.namprd12.prod.outlook.com
	([fe80::a5af:c3fb:16c6:2682%6]) with mapi id 15.20.2387.028;
	Fri, 1 Nov 2019 18:18:56 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] drivers: gpu: drm: amd: amdgpu: Add @level to
	amdgpu_vm_bo_param documentation
Thread-Index: AQHVkNLgdsgmzvIdGkC9ipWGCHijmqd2n/A4
Date: Fri, 1 Nov 2019 18:18:56 +0000
Message-ID:
 <BN6SPR00MB1824AA701FC65A47786A30CF7620@BN6SPR00MB182.namprd12.prod.outlook.com>
References: <20191101163856.GA13800@localhost.localdomain>
In-Reply-To: <20191101163856.GA13800@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [172.58.219.229]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 692ced16-0099-4233-4b60-08d75ef7f5be
x-ms-traffictypediagnostic: BN6PR12MB1649:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB164918857BB2141D43ECCC0EF7620@BN6PR12MB1649.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(189003)(199004)(51914003)(4326008)(99286004)(316002)(55016002)(54896002)(2906002)(476003)(229853002)(9686003)(3846002)(6116002)(53546011)(110136005)(66946007)(14454004)(25786009)(66476007)(54906003)(2501003)(66066001)(66556008)(64756008)(486006)(11346002)(446003)(76116006)(81156014)(7696005)(52536014)(74316002)(76176011)(105004)(19627405001)(33656002)(7736002)(26005)(66446008)(5660300002)(86362001)(102836004)(6506007)(6246003)(81166006)(6436002)(71200400001)(71190400001)(478600001)(8676002)(8936002)(14444005)(256004)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1649;
	H:BN6SPR00MB182.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q+8HhyX6SXRMI5rwS6geG7rm/1QKDVsHC+FSaAQHlClSe3x8F8viQ1ChjlDk50A8IKfJ0tpPEavNEhtoMqmHVqmkoGWa5hR1UllrpZj86mSgKWa4H9FRbSdUAYOIiyUWlEusnJm65/0kkHea8wyWldmeEhJ+ZmvISDb00kv7uXk8/sWDQfmcLyU9XrOZZkWBOhoqeAb4bKRz/Hbux+zqsTLyfJIUKdgUekayejtNfaZQmnglXRbk/y6UKDEj44DYXtyri74VHJf1ZBkkzN7yY8p1FfhvJE77QpWuH9Mne3QRjXNPW0rKfIzxgZ/rGpu1bUH2ABt/h+82g5HQE1ddGpdpIMNlK8khYE3UvvULqdjSSV25Q7zGLFn/ZxNF/Tbe6oYGfvuliff31ubZtUpgkhDBtQu/LSakz2JIe1LAE5fWU/aADl/AzeE9HPKxv9Yw
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692ced16-0099-4233-4b60-08d75ef7f5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 18:18:56.7757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmthHWfmjJ3eoy9cSq31DsFckvbuEIv/9Q9z7JnihIbYwpDw8KTlJWlls0b7Qi+eh3Bj6ALpponbtKc+su9beQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1649
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
	"airlied@linux.ie" <airlied@linux.ie>, "Kuehling,
	Felix" <Felix.Kuehling@amd.com>, "Huang,
	Ray" <Ray.Huang@amd.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"linux-kernel-mentees@lists.linuxfoundation.org"
	<linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
	Christian" <Christian.Koenig@amd.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: gpu: drm: amd: amdgpu:
 Add @level to amdgpu_vm_bo_param documentation
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6884001524482514700=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101181856.vxXLY5LYfhOW5put5CDf8g6TFZG3aYVQKTA0xWZo9-I@z>

--===============6884001524482514700==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6SPR00MB1824AA701FC65A47786A30CF7620BN6SPR00MB182namp_"

--_000_BN6SPR00MB1824AA701FC65A47786A30CF7620BN6SPR00MB182namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.  This has already been fixed.

Alex

________________________________
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Sent: Friday, November 1, 2019 12:38 PM
To: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org <linux-kernel-mentees@li=
sts.linuxfoundation.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; K=
oenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.=
Zhou@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <daniel=
@ffwll.ch>; Kuehling, Felix <Felix.Kuehling@amd.com>; Huang, Ray <Ray.Huang=
@amd.com>
Subject: [PATCH] drivers: gpu: drm: amd: amdgpu: Add @level to amdgpu_vm_bo=
_param documentation

The documentation for this function is missing the function parameter
"level", so add it. This fixes the following warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821:
        warning: Function parameter or member 'level'
        not described in 'amdgpu_vm_bo_param'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.c
index 5251352f5922..6f6a9be11d84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -813,6 +813,7 @@ static int amdgpu_vm_clear_bo(struct amdgpu_device *ade=
v,
  *
  * @adev: amdgpu_device pointer
  * @vm: requesting vm
+ * @level: VMPT level
  * @bp: resulting BO allocation parameters
  */
 static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amdgpu_v=
m *vm,
--
2.21.0


--_000_BN6SPR00MB1824AA701FC65A47786A30CF7620BN6SPR00MB182namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the patch.&nbsp; This has already been fixed.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jaskaran Singh &lt;ja=
skaransingh7654321@gmail.com&gt;<br>
<b>Sent:</b> Friday, November 1, 2019 12:38 PM<br>
<b>To:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;<br>
<b>Cc:</b> linux-kernel-mentees@lists.linuxfoundation.org &lt;linux-kernel-=
mentees@lists.linuxfoundation.org&gt;; Deucher, Alexander &lt;Alexander.Deu=
cher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Zhou,=
 David(ChunMing) &lt;David1.Zhou@amd.com&gt;; airlied@linux.ie
 &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; Kuehlin=
g, Felix &lt;Felix.Kuehling@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&g=
t;<br>
<b>Subject:</b> [PATCH] drivers: gpu: drm: amd: amdgpu: Add @level to amdgp=
u_vm_bo_param documentation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The documentation for this function is missing the=
 function parameter<br>
&quot;level&quot;, so add it. This fixes the following warning:<br>
<br>
./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warning: Function parameter or m=
ember 'level'<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not described in 'amdgpu_vm_bo_p=
aram'<br>
<br>
Signed-off-by: Jaskaran Singh &lt;jaskaransingh7654321@gmail.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.c<br>
index 5251352f5922..6f6a9be11d84 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
@@ -813,6 &#43;813,7 @@ static int amdgpu_vm_clear_bo(struct amdgpu_device =
*adev,<br>
&nbsp; *<br>
&nbsp; * @adev: amdgpu_device pointer<br>
&nbsp; * @vm: requesting vm<br>
&#43; * @level: VMPT level<br>
&nbsp; * @bp: resulting BO allocation parameters<br>
&nbsp; */<br>
&nbsp;static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amd=
gpu_vm *vm,<br>
-- <br>
2.21.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6SPR00MB1824AA701FC65A47786A30CF7620BN6SPR00MB182namp_--

--===============6884001524482514700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6884001524482514700==--
