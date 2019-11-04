#include "gentree.h"
#include "array_list.h"

struct GNode
{
  string elem;
  ArrayList children;
};

GenTree leaf(T_ELEM_TYPE x)
{
  /// COMPLETAR
  GNode* newNode = new GNode;
  newNode->elem = x;
  newNode->children = crearArrayList();
  return newNode;
}

bool isLeaf(GenTree t)
{
  /// COMPLETAR
  return isEmpty(t->children);
}

T_ELEM_TYPE value(GenTree t)
{
  /// COMPLETAR
  return t->elem;
}

ArrayList children(GenTree t)
{
  /// COMPLETAR
  return t->children;
}

void addChild(GenTree t, GenTree child)
{
  /// COMPLETAR
  add(t->children, child);
}

void destroyTree(GenTree t)
{
  /// COMPLETAR
  GenTree tmp = t;
  ArrayList chil = tmp->children;
  for(int i = 0; i < length(tmp->children); i++) {
    destroyTree(getAt(chil, i));
  }
  delete t;
}
