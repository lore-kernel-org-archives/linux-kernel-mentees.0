From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Sun, 30 Jun 2019 08:17:07 +0100
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH] Doc :
	doc-guide : Fix a typo
In-Reply-To: <20190628060111.24851-1-sheriffesseson@gmail.com>
References: <20190628060111.24851-1-sheriffesseson@gmail.com>
Message-ID: <20190630071707.GA12881@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190630071707.C1p6E5uO-ZOIgfYDp7UFU6t_8EOTHby5kzewL7fHLt4@z>

On Fri, Jun 28, 2019 at 07:01:11AM +0100, Sheriff Esseson wrote:
> fix the disjunction by replacing "of" with "or".
> 
> Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
> ---
> -- 
> 2.22.0
> 

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---

changes in v2:
- cc-ed Corbet.

 Documentation/doc-guide/kernel-doc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index f96059767..192c36af3 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -359,7 +359,7 @@ Domain`_ references.
   ``monospaced font``.
 
   Useful if you need to use special characters that would otherwise have some
-  meaning either by kernel-doc script of by reStructuredText.
+  meaning either by kernel-doc script or by reStructuredText.
 
   This is particularly useful if you need to use things like ``%ph`` inside
   a function description.
-- 
2.22.0
